$TargetFile = "\\medistar\ms$\prg4\m42t.exe"
$ShortcutFile1 = "$env:Public\Desktop\MEDISTAR T1.lnk"
$ShortcutFile2 = "$env:Public\Desktop\MEDISTAR T2.lnk"
$ShortcutFile3 = "$env:Public\Desktop\MEDISTAR T3.lnk"
$ShortcutFile4 = "$env:Public\Desktop\MEDISTAR T4.lnk"
$DestinationPath = "\\MEDISTAR\ms$\prg4\"
$Arguments1 = " desk-1"
$Arguments2 = " desk-2"
$Arguments3 = " desk-3"
$Arguments4 = " desk-4"


$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile1)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Arguments = $Arguments1
$Shortcut.WorkingDirectory = $DestinationPath
$Shortcut.Save()

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile2)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Arguments = $Arguments2
$Shortcut.WorkingDirectory = $DestinationPath
$Shortcut.Save()

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile3)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Arguments = $Arguments3
$Shortcut.WorkingDirectory = $DestinationPath
$Shortcut.Save()

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile4)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Arguments = $Arguments4
$Shortcut.WorkingDirectory = $DestinationPath
$Shortcut.Save()

write-output "                                "
write-output "                             OK!"
write-output "                                "

pause