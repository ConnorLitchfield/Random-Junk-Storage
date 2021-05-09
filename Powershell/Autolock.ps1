# To find ID wmic diskdrive get serialnumber

While ($true)
    {

$gotserial = wmic diskdrive get serialnumber | findstr "[0-9]"

if ($gotserial -Match "AARZT08LAXSX9RF2")
{
    Write-Output "The condition was true"
} Else {
    Write-Output "The condition was false"
    Invoke-Command {rundll32.exe user32.dll,LockWorkStation}
}
sleep 3
}