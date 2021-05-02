$imp = @"
drop user msuser cascade;
commit;
create or replace directory impdp_dir as 'd:\medistar\support\zSKI';
create or replace directory imp_dir as 'd:\medistar\support\zSKI';
// GRANT READ, WRITE ON DIRECTORY impdp_dir TO msuser; //
// GRANT READ, WRITE ON DIRECTORY imp_dir TO msuser; //
exit
"@

$imp2 = @"
drop user msuser cascade;
drop user cgmarchive cascade;
drop user cgmarchivecache cascade;
drop user cgmarchivetemp cascade;
commit;
create or replace directory impdp_dir as 'd:\medistar\support\zSKI';
create or replace directory imp_dir as 'd:\medistar\support\zSKI';
// GRANT READ, WRITE ON DIRECTORY impdp_dir TO msuser; //
// GRANT READ, WRITE ON DIRECTORY imp_dir TO msuser; //
exit
"@

$fin = @"
alter system set processes=930 scope=spfile;
alter system set sessions=1028 scope=spfile;
alter system set transactions=1030 scope=spfile;
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
shutdown immediate
startup
exit
"@

$inp = Read-Host -Prompt "MOVIESTAR ORACLE? J/N "

if ( $inp -eq "j"){
    
    $imp2 | sqlplus sys/Admin1234@medistar as sysdba

    impdp system/Admin1234@medistar directory=impdp_dir schemas=msuser, cgmarchive, cgmarchivecache, cgmarchivetemp TABLE_EXISTS_ACTION=REPLACE dumpfile=msmv.dmp logfile=IMPmsuser.log
    
    write-output "Import durchgefuehrt, jetzt noch die Finalisierung mit DB Neustart"
    
    pause
    
    $fin | sqlplus sys/Admin1234@medistar as sysdba
    
    write-output "cool, fertig"
    
    pause

} else {

    $imp | sqlplus sys/Admin1234@medistar as sysdba

    impdp system/Admin1234@medistar directory=impdp_dir schemas=msuser TABLE_EXISTS_ACTION=REPLACE dumpfile=msuser.dmp logfile=IMPmsuser.log

    write-output "Import durchgefuehrt, jetzt noch die Finalisierung mit DB Neustart"

    pause

    $fin | sqlplus sys/Admin1234@medistar as sysdba

    write-output "cool, fertig"

    pause

}