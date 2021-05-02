$sqlQuery = @"
select value
from flags_and_settings_global
where key_name='MS_DDL_UPDATED';
"@

$sqlQuery | sqlplus msuser/msuser1234@medistar 

pause