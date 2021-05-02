$Query = @"
backup validate check logical database;
list failure;
advise failure;
"@

$Query | rman target sys/Admin1234@medistar nocatalog

pause