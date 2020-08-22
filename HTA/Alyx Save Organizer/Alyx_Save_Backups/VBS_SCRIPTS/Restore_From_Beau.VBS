SET objFSO = CREATEOBJECT("Scripting.FileSystemObject")
Dim oShell : Set oShell = CreateObject("WScript.Shell")

DelDir="C:\Program Files (x86)\Steam\steamapps\common\Half-Life Alyx\game\hlvr\SAVE"
FromDir="C:\Alyx_Save_Backups\SAVES\Beau\SAVE"
ToDir="C:\Program Files (x86)\Steam\steamapps\common\Half-Life Alyx\game\hlvr\SAVE"

intAnswer = _
    Msgbox("WARNING this will delete the current save in steam and restore Beau's Save are you sure you want to do this?", _
        vbExclamation + vbYesNo, "Delete Files")

If intAnswer = vbYes Then
    objFSO.DeleteFolder DelDir
    objFSO.CopyFolder FromDir, ToDir
Else
    Msgbox "You answered no."
End If

oShell.AppActivate "1/2 Life Alyx Saved Game Backup Tool"
oShell.SendKeys "{F5}"
oShell.Run "taskkill /im cmd.exe", , True