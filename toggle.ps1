$file = "C:\Bakgrunner\state.txt"

$bilder = @(
    "C:\Bakgrunner\2025-11-23_00.49.50.png",
    "C:\Bakgrunner\bilde.jpg"
)

if (Test-Path $file) {
    $i = Get-Content $file
} else {
    $i = 0
}

$i = [int]$i
$i = ($i + 1) % 2

Set-Content $file $i

Add-Type @'
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", SetLastError=true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
'@

[Wallpaper]::SystemParametersInfo(20, 0, $bilder[$i], 3)