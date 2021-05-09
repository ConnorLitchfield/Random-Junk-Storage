# Load Dependancies
[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')    | out-null
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework')   | out-null
[System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')    | out-null
[System.Reflection.Assembly]::LoadWithPartialName('WindowsFormsIntegration') | out-null

# Set Variables
$wshell = New-Object -ComObject Wscript.Shell
$Global:i = 900
$Main_Tool_Icon = New-Object System.Windows.Forms.NotifyIcon
$Main_Tool_Icon.Text = $noteMsg
$Main_Tool_Icon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon("C:\Windows\System32\rstrui.exe") 
$Main_Tool_Icon.BalloonTipTitle = “Automatic Backup Utility”
$Main_Tool_Icon.BalloonTipIcon = “Info”
$title = “Automatic Backup Complete.”
$Main_Tool_Icon.BalloonTipText = $title
$Main_Tool_Icon.ShowBalloonTip(1)
$Main_Tool_Icon.Visible = $True
$Main_Tool_Icon.Add_Click({run-Procedure})

# Callable function that does all the work
function run-Procedure{

# Reset timer 
$Global:i = 900

# 1/1 Delete Zips in Google Drive folder D:\Backups\
try {
del "D:\Backups\*.zip"
} catch {
$wshell.Popup("ERROR Deleting Old Zip Files In Google Drive Folder, D:\Backups\")
}

# 2/2 Compress both folders to Google Drive folder D:\Backups\
try {
Compress-Archive -Path "D:\Users\Konastar\Desktop\Bachelor of Information and Technology\" -DestinationPath  ('D:\Backups\Study Backup ' + (get-date -Format yyyMMdd) + '.zip') -Force
Compress-Archive -Path "D:\Users\Konastar\Desktop\2021 Tax's\" -DestinationPath  ('D:\Backups\Tax Backup ' + (get-date -Format yyyMMdd) + '.zip') -Force
} catch {
$wshell.Popup("ERROR Zipping UniStudies To Google Drive Folder! D:\Backups")
}

# Show Balloon and set tool tip to waiting then wait 20
$Main_Tool_Icon.Text = "20 Second Cool Down"
$Main_Tool_Icon.ShowBalloonTip(1)
sleep 20

}

# While loop to count off timer, and display details on notification bar icon.
while ( $true ) {
do {
    $msgm = [timespan]::fromseconds($i)
    $m = $msgm.Minutes
    $s = $msgm.Seconds
    $noteMsg = "Next Backup In $m`:$s"
    $Main_Tool_Icon.Text = $noteMsg
    Sleep 1
    $Global:i--
} while ($i -ge 0)
run-Procedure
}