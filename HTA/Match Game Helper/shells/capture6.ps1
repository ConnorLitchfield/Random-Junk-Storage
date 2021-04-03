$cSource = @'
using System;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;
public class Clicker
{
//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646270(v=vs.85).aspx
[StructLayout(LayoutKind.Sequential)]
struct INPUT
{ 
    public int        type; // 0 = INPUT_MOUSE,
                            // 1 = INPUT_KEYBOARD
                            // 2 = INPUT_HARDWARE
    public MOUSEINPUT mi;
}

//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646273(v=vs.85).aspx
[StructLayout(LayoutKind.Sequential)]
struct MOUSEINPUT
{
    public int    dx ;
    public int    dy ;
    public int    mouseData ;
    public int    dwFlags;
    public int    time;
    public IntPtr dwExtraInfo;
}

//This covers most use cases although complex mice may have additional buttons
//There are additional constants you can use for those cases, see the msdn page
const int MOUSEEVENTF_MOVED      = 0x0001 ;
const int MOUSEEVENTF_LEFTDOWN   = 0x0002 ;
const int MOUSEEVENTF_LEFTUP     = 0x0004 ;
const int MOUSEEVENTF_RIGHTDOWN  = 0x0008 ;
const int MOUSEEVENTF_RIGHTUP    = 0x0010 ;
const int MOUSEEVENTF_MIDDLEDOWN = 0x0020 ;
const int MOUSEEVENTF_MIDDLEUP   = 0x0040 ;
const int MOUSEEVENTF_WHEEL      = 0x0080 ;
const int MOUSEEVENTF_XDOWN      = 0x0100 ;
const int MOUSEEVENTF_XUP        = 0x0200 ;
const int MOUSEEVENTF_ABSOLUTE   = 0x8000 ;

const int screen_length = 0x10000 ;

//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646310(v=vs.85).aspx
[System.Runtime.InteropServices.DllImport("user32.dll")]
extern static uint SendInput(uint nInputs, INPUT[] pInputs, int cbSize);

public static void LeftClickAtPoint(int x, int y)
{
    //Move the mouse
    INPUT[] input = new INPUT[3];
    input[0].mi.dx = x*(65535/System.Windows.Forms.Screen.PrimaryScreen.Bounds.Width);
    input[0].mi.dy = y*(65535/System.Windows.Forms.Screen.PrimaryScreen.Bounds.Height);
    input[0].mi.dwFlags = MOUSEEVENTF_MOVED | MOUSEEVENTF_ABSOLUTE;
    //Left mouse button down
    input[1].mi.dwFlags = MOUSEEVENTF_LEFTDOWN;
    //Left mouse button up
    input[2].mi.dwFlags = MOUSEEVENTF_LEFTUP;
    SendInput(3, input, Marshal.SizeOf(input[0]));
}
}
'@
Add-Type -TypeDefinition $cSource -ReferencedAssemblies System.Windows.Forms,System.Drawing
#Send a click at a specified point
$wshell = New-Object -ComObject wscript.shell
$wshell.AppActivate('App Player')

[Reflection.Assembly]::LoadWithPartialName("System.Drawing")
function screenshot([Drawing.Rectangle]$bounds, $path) {
   $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
   $graphics = [Drawing.Graphics]::FromImage($bmp)

   $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)

   $bmp.Save($path)

   $graphics.Dispose()
   $bmp.Dispose()
}

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(369,310)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(496,306)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(306,252,546,360)
screenshot $bounds "img/1.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(615,304)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(736,302)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(556,246,800,359)
screenshot $bounds "img/2.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(869,307)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(989,310)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(808,245,1048,360)
screenshot $bounds "img/3.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1112,307)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1245,307)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1059,247,1309,359)
screenshot $bounds "img/4.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1364,299)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1493,307)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1315,248,1558,364)
screenshot $bounds "img/5.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(369,436)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(496,436)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(306,371,546,490)
screenshot $bounds "img/6.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(615,436)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(736,436)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(556,371,800,490)
screenshot $bounds "img/7.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(869,436)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(989,436)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(808,371,1048,490)
screenshot $bounds "img/8.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1112,436)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1245,436)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1059,371,1309,490)
screenshot $bounds "img/9.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1364,436)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1493,436)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1315,371,1558,490)
screenshot $bounds "img/10.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(369,554)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(496,554)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(306,501,546,631)
screenshot $bounds "img/11.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(615,554)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(736,554)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(556,501,800,631)
screenshot $bounds "img/12.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(869,554)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(989,554)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(808,501,1048,631)
screenshot $bounds "img/13.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1112,554)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1245,554)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1059,501,1309,631)
screenshot $bounds "img/14.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1364,554)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1493,554)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1315,501,1558,631)
screenshot $bounds "img/15.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(369,680)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(496,680)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(306,626,546,736)
screenshot $bounds "img/16.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(615,680)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(736,680)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(556,626,800,736)
screenshot $bounds "img/17.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(869,680)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(989,680)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(808,626,1048,736)
screenshot $bounds "img/18.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1112,680)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1245,680)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1059,626,1309,736)
screenshot $bounds "img/19.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1364,680)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1493,680)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1315,626,1558,736)
screenshot $bounds "img/20.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(369,800)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(496,800)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(306,750,546,863)
screenshot $bounds "img/21.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(615,800)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(756,800)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(556,750,800,863)
screenshot $bounds "img/22.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(869,800)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(989,800)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(808,750,1048,863)
screenshot $bounds "img/23.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1112,800)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1245,800)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1059,750,1309,863)
screenshot $bounds "img/24.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1364,800)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1493,800)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1315,750,1558,863)
screenshot $bounds "img/25.png"

$wshell = New-Object -ComObject wscript.shell
$wshell.AppActivate('Match Helper Level 6')
$wshell.SendKeys("{F5}")