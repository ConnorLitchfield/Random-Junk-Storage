Set WshShell = WScript.CreateObject("WScript.Shell")

Dim SS
DIM MS
DIM LS

SS="150"
MS="300"
LS="1000"

WshShell.SendKeys "+{F8}"

Do
If (Wshshell.AppActivate("Create Corrective Maintenance Order : Central Header") = False) Then
Wshshell.AppActivate "Create Corrective Maintenance Order : Central Header"
WScript.Sleep(SS)
Else
If (Wshshell.AppActivate("Create Corrective Maintenance Order : Central Header") = True) Then exit do
End If
loop

WshShell.SendKeys "{TAB 8}"
WScript.Sleep(500)
WshShell.SendKeys "005"
WScript.Sleep(250)
WshShell.SendKeys "{TAB}"
WScript.Sleep(250)
WshShell.SendKeys "A"
WScript.Sleep(250)
WshShell.SendKeys "^s"
WScript.Sleep(250)
WshShell.SendKeys "^s"