$mappe = "C:\Bakgrunner"
$stateFile = Join-Path $mappe "state.txt"

# Hent alle bilder i mappen
$bilder = Get-ChildItem -Path $mappe -File |
    Where-Object { $_.Extension -match '^\.(jpg|jpeg|png|bmp)$' } |
    Sort-Object Name |
    Select-Object -ExpandProperty FullName

# Sjekk at det finnes bilder
if ($bilder.Count -eq 0) {
    Write-Host "Ingen bilder funnet i $mappe"
    exit
}

# Opprett state-fil hvis den ikke finnes
if (-not (Test-Path $stateFile)) {
    0 | Set-Content $stateFile
}

# Les gjeldende indeks
try {
    $i = [int](Get-Content $stateFile -ErrorAction Stop)
}
catch {
    $i = 0
}

# Sørg for at indeksen er gyldig
$i = $i % $bilder.Count

# Last inn Windows-funksjonen for å endre bakgrunn
if (-not ("Wallpaper" -as [type])) {
    Add-Type @'
using System.Runtime.InteropServices;

public class Wallpaper
{
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(
        int uAction,
        int uParam,
        string lpvParam,
        int fuWinIni
    );
}
'@
}

# Sett bakgrunnsbildet
[Wallpaper]::SystemParametersInfo(20, 0, $bilder[$i], 3) | Out-Null

# Lagre neste indeks
(($i + 1) % $bilder.Count) | Set-Content $stateFile

Write-Host "Bakgrunn endret til:"
Write-Host $bilder[$i]
