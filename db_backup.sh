echo "Backup start!"

current=$(date + "%Y%m%d")

docker exec mysql /usr/bin/mysqldump -u oic_yju --password=oic_yju e_global_zone > DB_backup/backup_$current.sql

echo "Backup complete. Check the path 저장경로"

