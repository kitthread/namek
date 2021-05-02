$sqlQuery = @"
create or replace directory exp_dir as 'd:\medistar\support\zSKI';
create or replace directory expdp_dir as 'd:\medistar\support\zSKI';
GRANT READ, WRITE ON DIRECTORY exp_dir TO msuser;
GRANT READ, WRITE ON DIRECTORY expdp_dir TO msuser;
exit
"@

$inp = Read-Host -Prompt "MOVIESTAR ORACLE? J/N "

if ( $inp -eq "j") {

    $sqlQuery | sqlplus sys/Admin1234@medistar as sysdba

    expdp system/Admin1234@medistar directory=expdp_dir schemas=msuser, cgmarchive, cgmarchivecache, cgmarchivetemp dumpfile=msmv.dmp logfile=EXPmsuser.log reuse_dumpfiles=Y

    pause

}else{

    $sqlQuery | sqlplus sys/Admin1234@medistar as sysdba

    expdp system/Admin1234@medistar directory=expdp_dir schemas=msuser dumpfile=msuser.dmp logfile=EXPmsuser.log reuse_dumpfiles=Y
    
    pause

}