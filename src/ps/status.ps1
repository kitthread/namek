$sqlQuery = @'
select instance_name from v$instance;
select status from v$instance;
select logins from v$instance;
prompt ACTIVE SESSIONS:
select count(*) from v$session;
prompt ACTIVE PROCESSES:
select count(*) from v$process;
prompt OPEN CURSORS:
select count(*) from v$open_cursor;
prompt
prompt SHOW ERRORS:
show errors;
prompt
prompt SHOW BLOCK CORRUPTION:
select * from V_$DATABASE_BLOCK_CORRUPTION;
'@

$sqlQuery | sqlplus sys/Admin1234@medistar as sysdba

pause