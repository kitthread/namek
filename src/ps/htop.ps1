$saveY = [console]::CursorTop
$saveX = [console]::CursorLeft      

while ($true) {
    Get-Process | Sort -Descending CPU | Select -First 30;
    Sleep -Seconds 2;
    [console]::setcursorposition($saveX,$saveY+3)

    # if ($HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")) {break}
}until ($HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")) {break}

start .\res\MISC.cmd
clear
powershell -ExecutionPolicy ByPass -File .\res\htop.ps1