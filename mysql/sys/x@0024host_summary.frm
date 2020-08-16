TYPE=VIEW
query=select if(isnull(`performance_schema`.`accounts`.`HOST`),\'background\',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,(sum(`stmt`.`total_latency`) / sum(`stmt`.`total`)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `sys`.`x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `sys`.`x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `sys`.`x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if(isnull(`performance_schema`.`accounts`.`HOST`),\'background\',`performance_schema`.`accounts`.`HOST`)
md5=f66f55631884ccf08c40d226be32f1b0
updatable=0
algorithm=1
definer_user=mysql.sys
definer_host=localhost
suid=0
with_check_option=0
timestamp=2020-08-16 07:21:27
create-version=1
source=SELECT IF(accounts.host IS NULL, \'background\', accounts.host) AS host, SUM(stmt.total) AS statements, SUM(stmt.total_latency) AS statement_latency, SUM(stmt.total_latency) / SUM(stmt.total) AS statement_avg_latency, SUM(stmt.full_scans) AS table_scans, SUM(io.ios) AS file_ios, SUM(io.io_latency) AS file_io_latency, SUM(accounts.current_connections) AS current_connections, SUM(accounts.total_connections) AS total_connections, COUNT(DISTINCT accounts.user) AS unique_users, SUM(mem.current_allocated) AS current_memory, SUM(mem.total_allocated) AS total_memory_allocated FROM performance_schema.accounts JOIN sys.x$host_summary_by_statement_latency AS stmt ON accounts.host = stmt.host JOIN sys.x$host_summary_by_file_io AS io ON accounts.host = io.host JOIN sys.x$memory_by_host_by_current_bytes mem ON accounts.host = mem.host GROUP BY IF(accounts.host IS NULL, \'background\', accounts.host)
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select if(isnull(`performance_schema`.`accounts`.`HOST`),\'background\',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,(sum(`stmt`.`total_latency`) / sum(`stmt`.`total`)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `sys`.`x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `sys`.`x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `sys`.`x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if(isnull(`performance_schema`.`accounts`.`HOST`),\'background\',`performance_schema`.`accounts`.`HOST`)
