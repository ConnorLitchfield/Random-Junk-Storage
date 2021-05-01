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
[Clicker]::LeftClickAtPoint(380,331)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(531,333)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(300, 250, 613, 397)
screenshot $bounds "img/1.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(687,331)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(848,333)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(612, 250, 924, 397)
screenshot $bounds "img/2.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1007,333)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1158,333)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(932, 250, 1247, 397)
screenshot $bounds "img/3.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1325,331)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1482,333)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1248, 250, 1565, 397)
screenshot $bounds "img/4.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(373,447)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(543,479)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(300, 407, 613, 552)
screenshot $bounds "img/5.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(689,480)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(846,481)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(620, 407, 925, 552)
screenshot $bounds "img/6.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1016,486)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1166,479)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(936, 407, 1244, 552)
screenshot $bounds "img/7.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1333,480)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1479,490)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1249, 407, 1564, 552)
screenshot $bounds "img/8.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(376,624)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(529,633)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(298, 565, 609, 705)
screenshot $bounds "img/9.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(691,640)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(847,643)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(616, 565, 933, 705)
screenshot $bounds "img/10.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1009,638)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1168,641)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(929, 565, 1242, 705)
screenshot $bounds "img/11.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1316,637)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1489,639)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1246, 565, 1563, 705)
screenshot $bounds "img/12.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(382,798)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(541,800)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(305, 723, 613, 865)
screenshot $bounds "img/13.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(694,797)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(846,790)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(621, 723, 925, 865)
screenshot $bounds "img/14.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1008,794)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1167,795)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(937, 723, 1240, 865)
screenshot $bounds "img/15.png"

Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1316,789)
Start-Sleep -s 1
[Clicker]::LeftClickAtPoint(1479,800)
Start-Sleep -s 1
$bounds = [Drawing.Rectangle]::FromLTRB(1251, 723, 1559, 865)
screenshot $bounds "img/16.png"

$wshell = New-Object -ComObject wscript.shell
$wshell.AppActivate('Match Helper Level 5')
$wshell.SendKeys("{F5}")