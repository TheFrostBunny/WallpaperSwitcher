$file = "C:\Backgrounds\state.txt"

$wallpapers = @(
    "C:\Backgrounds\2025-11-23_00.49.50.png",
    "C:\Backgrounds\image.jpg"
)

# Read current wallpaper state
if (Test-Path $file) {
    $index = Get-Content $file
} else {
    $index = 0
}

# Switch to next wallpaper
$index = [int]$index
$index = ($index + 1) % $wallpapers.Count

# Save current state
Set-Content $file $index

# Load Windows API for changing wallpaper
Add-Type @'
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", SetLastError=true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
'@

# Set desktop wallpaper
[Wallpaper]::SystemParametersInfo(20, 0, $wallpapers[$index], 3)
