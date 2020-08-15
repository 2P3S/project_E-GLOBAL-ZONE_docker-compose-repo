<?php

namespace App\Http\Controllers;

use App\Schedule;
use App\Student_foreigner;
use App\Section;
use App\Setting;
use App\Reservation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Validator;

class ScheduleController extends Controller
{
    /**
     * 한국인학생 - 해당 일자 전체 스케줄 조회
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'sch_start_date' => 'required|date',
            'sch_end_date' => 'required|date',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors(),
            ], 422);
        }

        //TODO 날짜 계산 찾아보기.
        $allSchdules = Schedule::select('sch_id', 'sch_res_count', 'sch_start_date', 'sch_end_date', 'std_for_name', 'std_for_lang')
            ->where('schedules.sch_start_date', '>=', $request->sch_start_date)
            ->where('schedules.sch_start_date', '<=', $request->sch_end_date)
            ->join('student_foreigners as for', 'schedules.sch_std_for', 'for.std_for_id')
            ->get();

        // 등록된 스케줄이 없을 경우
        if ($allSchdules->count() === 0) {
            return response()->json([
                'message' => '등록된 스케줄이 없습니다.',
            ], 404);
        }

        return response()->json([
            'message' => '일정 조회를 성공하였습니다.',
            'result' => $allSchdules,
        ], 200);
    }

    /**
     * 유학생 - 특정 날짜 개인 스케줄 조회
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($date)
    {
        $std_for_id = 1372367;
        $result_foreigner_schedules = Schedule::where('sch_std_for', $std_for_id)
            ->whereDate('sch_start_date', $date)
            ->get();

        return $result_foreigner_schedules;
    }

    /**
     * 관리자 - 스케줄 등록
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $setting_value = Setting::orderBy('setting_date', 'DESC')->get()->first();      /* 환경설정 변수 */

        $data = json_decode($request->getContent(), true);
        $ecept_date = $data['ecept_date'];                                              /* 제외날짜 */
        $sect = Section::find($data['sect_id']);                                        /* 학기 데이터 */

        $sect_start_date = strtotime($sect->sect_start_date);
        $sect_start_date = date("Y-m-d", $sect_start_date);
        $sect_end_date = strtotime($sect->sect_end_date);
        $sect_end_date = date("Y-m-d", $sect_end_date);

        $yoil = array("일", "월", "화", "수", "목", "금", "토");

        $sect_start_yoil = $yoil[date('w', strtotime($sect_start_date))];               /* 시작날짜 요일 */
        // echo ($yoil[date('w', strtotime($sect_end_date))]);                          /* 종료날짜 요일 */

        // 학기 시작 날짜에 맞춰 시작 날짜 재설정
        if ($sect_start_yoil == "토") {
            $sect_start_date = strtotime("{$sect_start_date} +2 day");
            /* 날짜 String 변경 */
            $sect_start_date = date("Y-m-d", $sect_start_date);
        } else if ($sect_start_yoil == "일") {
            $sect_start_date = strtotime("{$sect_start_date} +1 day");
            /* 날짜 String 변경 */
            $sect_start_date = date("Y-m-d", $sect_start_date);
        }

        $isRepeatMode = true;                                                           /* 반복모드 설정 */

        while ($isRepeatMode) {
            // 요일별 데이터 출력
            foreach ($data['schedule'] as $day) {
                // 제외 날짜인 경우 패스.
                if (!empty($ecept_date[0]) && $sect_start_date == $ecept_date[0]) {
                    // 해당 날짜 배열에서 제거.
                    array_shift($ecept_date);
                    // 날짜 변경
                    $sect_start_date = $yoil[date('w', strtotime($sect_start_date))] == '금' ?
                        strtotime("{$sect_start_date} +3 day") :
                        strtotime("{$sect_start_date} +1 day");
                    /* 날짜 String 변경 */
                    $sect_start_date = date("Y-m-d", $sect_start_date);
                    continue;
                }

                // 요일별 학생 목록
                foreach ($day as $student_id => $student) {
                    // 시간 리스트 목록
                    foreach ($student as $hour) {
                        // 줌 비밀번호 생성
                        $zoom_pw = mt_rand(1000, 9999);

                        $sch_start_date = strtotime($sect_start_date . " " . $hour . ":00:00");
                        $sch_end_date = strtotime($sect_start_date . " " . $hour . ":{$setting_value->once_meet_time}:00");
                        $sch_start_date = date("Y-m-d H:i:s", $sch_start_date);
                        $sch_end_date = date("Y-m-d H:i:s", $sch_end_date);

                        Schedule::create([
                            'sch_sect' => $sect->sect_id,
                            'sch_std_for' => $student_id,
                            'sch_start_date' => $sch_start_date,
                            'sch_end_date' => $sch_end_date,
                            'sch_for_zoom_pw' => $zoom_pw,
                        ]);

                        //TODO 환경변수 추가해서 시작 - 종료시간 설정.
                        // 줌 비밀번호 생성
                        $zoom_pw = mt_rand(1000, 9999);
                        $start_time = $setting_value->once_meet_time + $setting_value->once_rest_time;
                        $end_time = $start_time + $setting_value->once_meet_time;
                        $sch_start_date = strtotime($sect_start_date . " " . $hour . ":{$start_time}:00");
                        $sch_end_date = strtotime($sect_start_date . " " . $hour . ":{$end_time}:00");

                        $sch_start_date = date("Y-m-d H:i:s", $sch_start_date);
                        $sch_end_date = date("Y-m-d H:i:s", $sch_end_date);

                        Schedule::create([
                            'sch_sect' => $sect->sect_id,
                            'sch_std_for' => $student_id,
                            'sch_start_date' => $sch_start_date,
                            'sch_end_date' => $sch_end_date,
                            'sch_for_zoom_pw' => $zoom_pw,
                        ]);
                    }
                }

                // 종료 날짜에 맞춰 반복문 종료.
                if ($sect_start_date == $sect_end_date) {
                    $isRepeatMode = false;
                    break;
                }

                /*  날짜 변경 공식
                    월 ~ 목 => +1day
                    금      => +3day
                */
                $sect_start_date = $yoil[date('w', strtotime($sect_start_date))] == '금' ?
                    strtotime("{$sect_start_date} +3 day") :
                    strtotime("{$sect_start_date} +1 day");
                /* 날짜 String 변경 */
                $sect_start_date = date("Y-m-d", $sect_start_date);
            }
        }

        return response()->json([
            'message' => '스케줄 생성 완료',
        ], 200);
    }

    /**
     * 관리자 - 특정 스케줄 업데이트
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Schedule $sch_id)
    {
        $validator = Validator::make($request->all(), [
            'sch_sect' => 'required|integer',
            'sch_std_for' => 'required|integer',
            'sch_start_date' => 'required|date',
            'sch_end_date' => 'required|date',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors(),
            ], 422);
        }

        $update_schedule = $sch_id->update([
            'sch_start_date' => $request->sch_start_date,
            'sch_end_date' => $request->sch_end_date,
        ]);

        return response()->json([
            'message' => '스케줄 업데이트 완료',
            'result' => $update_schedule,
        ], 200);
    }

    /**
     * 관리자 - 특정 스케줄 삭제
     *
     * @param  int  $sch_id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Schedule $sch_id)
    {
        $sch_id->delete();

        return response()->json([
            'message' => '스케줄 삭제 완료',
        ], 204);
    }

    /**
     * 관리자 - 해당 날짜 출석 결과 미입력건 조회
     *
     * @param  string  $date
     * @return \Illuminate\Http\Response
     */
    public function indexUninputedList($date)
    {
        $uninput_list = Schedule::select('schedules.sch_id', 'std_for_id', 'std_for_name', 'sch_start_date', 'sch_end_date')
            ->join('student_foreigners as for', 'schedules.sch_std_for', '=', 'for.std_for_id')
            ->whereDate('sch_start_date', $date)
            ->where('sch_state_of_result_input', false)
            ->get();

        foreach($uninput_list as $schedule) {
            $kor_data =  Reservation::select('std_kor_id','std_kor_name', 'res_state_of_attendance')
            ->join('student_koreans as kor', 'reservations.res_std_kor', '=', 'std_kor_id')
            ->where('res_sch', $schedule['sch_id'])
            ->get();
            // 한국인 학생 정보 추가.
            $schedule['student_korean'] = $kor_data;
        }

        return response()->json([
            'message' => $date . ' 일 출석 결과 미입력건 조회',
            'data' => $uninput_list,
        ], 200);
    }

    /**
     * 관리자 - 해당 날짜 출석 결과 미승인건 조회
     *
     * @param  string  $date
     * @return \Illuminate\Http\Response
     */
    public function indexUnapprovedList($date)
    {
        $unapproved_list = Schedule::select('schedules.sch_id', 'std_for_id', 'std_for_name', 'sch_start_date', 'sch_end_date', 'start_img_url', 'end_img_url')
            ->join('student_foreigners as for', 'schedules.sch_std_for', '=', 'for.std_for_id')
            ->join('schedules_result_imgs as img', 'schedules.sch_id', '=', 'img.sch_id')
            ->whereDate('sch_start_date', $date)
            ->where('sch_state_of_result_input', true)
            ->where('sch_state_of_permission', false)
            ->get();

        foreach($unapproved_list as $schedule) {
            $kor_data =  Reservation::select('std_kor_id','std_kor_name', 'res_state_of_attendance')
            ->join('student_koreans as kor', 'reservations.res_std_kor', '=', 'std_kor_id')
            ->where('res_sch', $schedule['sch_id'])
            ->get();
            // 한국인 학생 정보 추가.
            $schedule['student_korean'] = $kor_data;
        }

        return response()->json([
            'message' => $date . ' 일 출석 결과 미승인건 조회',
            'data' => $unapproved_list,
        ], 200);
    }

    /**
     * 관리자 - 출석 결과 미승인 건 승인
     *
     * @param  int  $sch_id
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function updateApprovalOfUnapprovedCase(Request $request, Schedule $sch_id)
    {
        // 학생 출석 결과 변경 요청 -> 해당 학생 출석결과 변경 진행.
        if(!empty($request->reservation)) {
            $reservation = $request->reservation;

            foreach($reservation as $data) {
                Reservation::find($data['res_id'])->update([
                    'res_state_of_attendance' => $data['res_state_of_attendance']
                ]);
            }
        }

        // 출석결과 승인
        $sch_id->update([
          'sch_state_of_permission' => true
        ]);

        return response()->json([
            'message' => '출석 결과 승인',
        ], 200);
    }
}