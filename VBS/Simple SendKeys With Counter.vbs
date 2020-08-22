Set WshShell = WScript.CreateObject("WScript.Shell") 'Has to be declared for functions that use WshShell I.E. SendKeys.

Dim x 			'Declare a Variable.
x=0			'Set initial value for variable.

Do Until x=5 		'Start a do loop until variable x = 5.
x=x+1 			'Set Variable x to its current value plus 1, note if you had X=+1 it would set x to 0 than add 1.

WScript.Sleep 7000	'This is where your looped code starts.
WshShell.SendKeys "p"	

Loop			'Continue Do Loop.