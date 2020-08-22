SET objFSO = CREATEOBJECT("Scripting.FileSystemObject")
Dim oShell : Set oShell = CreateObject("WScript.Shell")
strFolder1 = Year(Date)*10000 + Month(Date)*100 + Day(Date) & " Backup Utility"
strFolder2 = Year(Date)*10000 + Month(Date)*100 + Day(Date) & " Steam"

    If objFSO.FolderExists("C:\Complete_Alyx_Save_Backups\" & strFolder1) Then
        objFSO.DeleteFolder "C:\Complete_Alyx_Save_Backups\" & strFolder1
    End If

    If objFSO.FolderExists("C:\Complete_Alyx_Save_Backups\" & strFolder2) Then
        objFSO.DeleteFolder "C:\Complete_Alyx_Save_Backups\" & strFolder2
    End If

objFSO.CreateFolder("C:\Complete_Alyx_Save_Backups\" & strFolder1)
objFSO.CreateFolder("C:\Complete_Alyx_Save_Backups\" & strFolder2)
objFSO.CopyFolder "C:\Alyx_Save_Backups", "C:\Complete_Alyx_Save_Backups\" & strFolder1
objFSO.CopyFolder "C:\Program Files (x86)\Steam\steamapps\common\Half-Life Alyx\game\hlvr\SAVE", "C:\Complete_Alyx_Save_Backups\" & strFolder2
Msgbox "Complete Backup Of Save Utility & Steam Save Folder Completed"
oShell.Run "taskkill /im cmd.exe", , True