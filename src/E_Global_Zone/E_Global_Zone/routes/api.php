<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/* 스케줄 라우터 */

Route::prefix('/schedule')->group(function () {
    /* 유학생 - 특정 날짜 개인 스케줄 조회 */
    Route::get('{date}', 'ScheduleController@show')->name('schedules.show');
    /* 한국인학생 - 해당 일자 전체 스케줄 조회 */
    Route::post('korean', 'ScheduleController@index')->name('schedules.index');
    /* 스케줄 등록 */
    Route::post('', 'ScheduleController@store')->name('schedules.store');
    /* 특정 스케줄 업데이트 */
    Route::put('{sch_id}', 'ScheduleController@update')->name('schedules.update');
    /* 특정 스케줄 삭제 */
    Route::delete('{sch_id}', 'ScheduleController@destroy')->name('schedules.destroy');
});

/* 계열 / 학과 관리 라우터 */
Route::prefix('/department')->group(function () {
    /** 등록된 계열 & 학과 목록 조회 */
    Route::get('', 'DepartmentController@index')->name('departments.index');
    /** 계열 & 학과 등록 */
    Route::post('', 'DepartmentController@store')->name('departments.store');
    /** 계열 & 학과 이름 변경 */
    Route::patch('{dept_id}', 'DepartmentController@update')->name('departments.update');
    /** 계열 & 학과 삭제 */
    Route::delete('{dept_id}', 'DepartmentController@destroy')->name('departments.destroy');
});

/* 관리자 라우터 */
Route::prefix('/admin')->group(function () {
    /* 유학생 관리 */
    Route::prefix('/foreigner')->group(function () {
        /** 학기별 전체 유학생 정보 조회 */
        Route::get('{wokr_sect}', 'ForeignerController@index')->name('foreigners.index');
        /** 특정 유학생 정보 조회 */
        Route::post('', 'ForeignerController@show')->name('foreigners.show');
        /** 학기별 유학생 등록 */
        Route::post('/work', 'ForeignerController@store')->name('foreigners.store');
        /** 학기별 유학생 수정 */
        Route::delete('{work_list_id}', 'ForeignerController@destroy')->name('foreigners.destroy');

        /** 유학생 계정 생성 */
        Route::post('account', 'ForeignerController@registerAccount')->name('foreigners.registerAccount');
        /** 유학생 비밀번호 변경 */
        Route::patch('account/{std_for_id}', 'ForeignerController@updateAccount')->name('foreigners.updateAccount');
        /** 유학생 계정 삭제 */
        Route::delete('account/{std_for_id}', 'ScheduleController@destroyAccount')->name('foreigners.destroyAccount');

        /** 학생정보 CSV 파일 다운로드 */
        // Route::get('data/{id}', 'ForeignerController@csv')->name('foreigners.csv');
    });

    /* 한국인학생 관리 */
    Route::prefix('/korean')->group(function () {
        /** 계정 등록 - 대기 명단 조회 */
        Route::get('approval', 'KoreanController@indexApproval')->name('koreans.indexApproval');
        /** 계정 등록 - 승인 */
        Route::patch('approval', 'KoreanController@updateApproval')->name('koreans.updateApproval');

        /** 전체 한국인 학생 정보 조회 */
        Route::get('', 'KoreanController@index')->name('koreans.index');

        /** 한국인 학생 계정 생성 */
        Route::post('account', 'KoreanController@registerAccount')->name('koreans.registerAccount');
        /** 계정 삭제 */
        Route::delete('account/{std_kor_id}', 'KoreanController@destroyAccount')->name('koreans.destroyAccount');

        // <-- 이용제한 한국인 학생
        Route::prefix("restrict")->group(function () {
            Route::get("/", "RestrictKoreanController@index")->name("koreans.indexRestrict");
            Route::post("/", "RestrictKoreanController@register")->name("koreans.registerRestrict");
            Route::patch("/{restrict_id}", "RestrictKoreanController@update")->name("koreans.updateRestrict");
        });

        // 이용제한 한국인 학생-->
//        /** 이용 제한 등록 */
//        Route::get('restrict/{std_kor_id}', 'RestrictKoreanController@indexRestrict')->name('koreans.indexRestrict');
//        /** 이용 제한 해제 */
//        Route::delete('restrict/{std_kor_id}', 'RestrictKoreanController@destroyRestrict')->name('koreans.destroyRestrict');

        /** 학년도별 학생정보 CSV 파일 다운로드 */
        // Route::get('data/{id}', 'KoreanController@csv')->name('koreans.csv');
    });

    /* 학기 관리 라우터 */
    Route::prefix('/section')->group(function () {
        /** 등록된 전체 학기 목록 조회 */
        Route::get('', 'SectionController@index')->name('sections.index');

        /** 학기 등록 */
        Route::post('', 'SectionController@store')->name('sections.store');

        /** 학기 수정 */
        Route::patch('{sect_id}', 'SectionController@update')->name('sections.update');

        /** 학기 삭제 */
        Route::delete('{sect_id}', 'SectionController@destroy')->name('sections.destroy');
    });

    /* 환경변수 관리 라우터 */
    Route::prefix('/setting')->group(function () {
        /** 등록된 환경변수 조회 */
        Route::get('', 'SettingController@index')->name('settings.index');

        /** 환경변수 저장 */
        Route::post('', 'SettingController@store')->name('settings.store');
    });

    /* 스케줄 관리 라우터 */
    Route::prefix('/schedule')->group(function () {
        /** 해당 날짜 출석 결과 미입력건 조회 */
        Route::get('no_input/{date}', 'ScheduleController@indexUninputedList')->name('schedules.indexUninputedList');

        /** 해당 날짜 출석 결과 미승인건 조회 */
        Route::get('no_result/{date}', 'ScheduleController@indexUnapprovedList')->name('schedules.indexUnapprovedList');

        /** 출석 결과 미승인 건 승인 */
        Route::patch('no_result/{sch_id}', 'ScheduleController@updateApprovalOfUnapprovedCase')->name('schedules.updateApprovalOfUnapprovedCase');
    });
});

/* 유학생 라우터 */
Route::prefix('/foreigner')->group(function () {
    /* 예약 관련 */
    Route::prefix('/reservation')->group(function () {
        /** 해당 스케줄 신청 학생 명단 조회 */
        Route::get('{sch_id}', 'ReservationController@showReservation')->name('reservations.showReservation');
        /** 해당 스케줄 신청 학생 명단 승인 */
        Route::patch('/approve', 'ReservationController@updateReservaion')->name('reservations.updateReservaion');
        /** 해당 스케줄 출석 결과 입력 */
        Route::post('/result', 'ReservationController@inputResult')->name('reservations.inputResult');
    });
});

// TODO 한국인 학생의 이용제한 확인??
/* 한국인학생 라우터 */
Route::prefix('/korean')->group(function () {
    /* 예약 관련 */
    Route::prefix('/reservation')->group(function () {
        /** 내 예약 일정 조회 */
        Route::get('', 'ReservationController@show')->name('reservations.show');
        /** 예약 신청 */
        Route::post('', 'ReservationController@store')->name('reservations.store');
        /** 내 예약 일정 삭제 */
        Route::delete('{res_id}', 'ReservationController@destroy')->name('reservations.destroy');
        /** 학기별 참석 결과 조회 */
        // Route::get('', 'ReservationController@showResult')->name('reservations.show');
    });
});

/* 로그인 라우터 */
Route::prefix('/auth')->group(function () {
    /* 학생 인증 관련 */
    Route::prefix('/korean')->group(function () {
        /** 로그인 */
        /** 토큰 검사 */
    });

    /* 유학생 인증 관련 */
    Route::prefix('/foreigner')->group(function () {
        /** 로그인 */
        /** 토큰 검사 */
    });

    /* 관리자 인증 관련 */
    Route::prefix('/admin')->group(function () {
        /** 로그인 */
    });
});

Route::prefix('login')->group(static function () {
    Route::post('admin', 'LoginController@adminLogin')->name('auth.adminsLogin');
    Route::post('foreigner', 'LoginController@foreignerLogin')->name('auth.foreignersLogin');
});

Route::middleware('auth.multi')->group(static function () {
    Route::post('logout', 'LoginController@logout')->name('auth.logout');

    Route::prefix('request')->group(static function () {
        Route::get('admin', 'LoginController@adminRequest')->name('auth.adminsRequest');
        Route::get('foreigner', 'LoginController@foreignerRequest')->name('auth.foreignersRequest');
    });
});