$sqlQuery = @"
create or replace directory impdp_dir as 'D:\MEDISTAR\SICHERUNG';
create or replace directory expdp_dir as 'D:\MEDISTAR\SICHERUNG';
drop table msuser.TABELLE cascade constraints;
exit
"@

$sqlQuery | impdp system/Admin1234@medistar directory=expdp_dir tables=msuser.TABELLE dumpfile=msuser logfile=tabelle.log