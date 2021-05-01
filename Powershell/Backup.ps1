$wshell = New-Object -ComObject Wscript.Shell

try {
del "D:\Backups\*.zip"
$Var1 = 1
} catch {
Echo "ERROR Deleting Old Zip Files In Google Drive Folder, D:\Backups."
Echo ""
}

try {
del "D:\Backups\Last Backup.txt"
$Var2 = 1
} catch {
Echo "ERROR Deleting Old Last Backup.txt File In Google Drive Folder, D:\Backups."
Echo ""
}

try {
Compress-Archive -Path "D:\Users\Jerremy\Desktop\Bachelor of Information and Technology\" -DestinationPath  ('D:\Backups\Study Backup ' + (get-date -Format yyyMMdd) + '.zip') -Force
$Var3 = 1
} catch {
Echo "ERROR Zipping UniStudies To Google Drive Folder!"
Echo ""
}

try {
Compress-Archive -Path "D:\Users\Jerremy\Desktop\2021 Tax's\" -DestinationPath  ('D:\Backups\Tax Backup ' + (get-date -Format yyyMMdd) + '.zip') -Force
$Var4 = 1
} catch {
Echo "ERROR Zipping Tax To Google Drive Folder!"
Echo ""
}

try {
Copy-Item -Path "D:\Backups\*" -Destination "F:\Backups" -errorAction stop
$Var5 = 1
} catch {
Echo "ERROR F:\Backups Not Present, New Zip Backup NOT Copied To External Flash."
Echo ""
}

try {
Copy-Item -Path "D:\Backups\*" -Destination "F:\Backups" -errorAction stop
$Date = Get-date
Out-File -FilePath "D:\Backups\Last Backup.txt" -InputObject $Date
$Var6 = 1
} catch {
Echo "ERROR Writing to Last Backup.txt."
Echo ""
}

$Var7 = $Var1 + $Var2 + $Var3 + $Var4 + $Var5 + $Var6

if ($var7 -eq 6)
{
}
Else
{ 
Echo "THERE WAS A ERROR, review error above."
$wshell.Popup("THERE WAS A ERROR BACKING UP DATA, review error window.",0,"OK",0x0)
Pause
}
