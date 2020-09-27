echo "Backup start!"

current=$(date +"%Y-%m-%d_%H:%M:%S")
today=$(date +"%Y년 %m월 %d일")

backup_command="cat backup_$current.sql | docker exec -i mysql /usr/bin/mysql -u oic_yju --password=oic_yju e_global_zone"

dir="/home/ubuntu"
docker exec mysql /usr/bin/mysqldump -u oic_yju --password=oic_yju e_global_zone > $dir/E_Global_Zone/server/DB_backup/backup_$current.sql

echo "[ $today 기준 백업 Data ]\n\n백업 명령어 : $backup_command" | mutt -s "[BACK UP] $today" oic.yju@gmail.com -a $dir/E_Global_Zone/server/DB_backup/backup_$current.sql

echo "[$current] Backup complete. Check the path 저장경로"

