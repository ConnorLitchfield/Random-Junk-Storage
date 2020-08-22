Set WshShell = WScript.CreateObject("WScript.Shell")

DIM SS

SS="50"
SECTION="FIRESUPP"

WScript.Sleep(SS)
WshShell.SendKeys ("^a")
WScript.Sleep(SS)
WshShell.SendKeys "{DELETE}"
WScript.Sleep(SS)
WshShell.SendKeys SECTION
WScript.Sleep(SS)
WshShell.SendKeys "{TAB}"
WScript.Sleep(SS)
WshShell.SendKeys ("^a")
WScript.Sleep(SS)
WshShell.SendKeys "{DELETE}"
WScript.Sleep(SS)
WshShell.SendKeys SECTION
WScript.Sleep(SS)
WshShell.SendKeys "{DOWN}"
WScript.Sleep(SS)
WshShell.SendKeys "^{LEFT}"