SET objFSO = CREATEOBJECT("Scripting.FileSystemObject")
Dim oShell : Set oShell = CreateObject("WScript.Shell")

Sub Run(ByVal sFile)
Dim shell

    Set shell = CreateObject("WScript.Shell")
    shell.Run Chr(34) & sFile & Chr(34), 1, false
    Set shell = Nothing
End Sub

Run "C:\Program Files (x86)\Steam\steamapps\common\Half-Life Alyx\game\bin\win64\hlvr.exe"

oShell.AppActivate "1/2 Life Alyx Saved Game Backup Tool"
oShell.SendKeys "{F5}"
oShell.Run "taskkill /im cmd.exe", , True