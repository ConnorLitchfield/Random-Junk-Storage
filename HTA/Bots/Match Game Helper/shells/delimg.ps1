Remove-Item –path img\* -include *.png
$wshell = New-Object -ComObject wscript.shell
$wshell.AppActivate('Match Game Helper')
$wshell.SendKeys("{F5}")