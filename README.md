# Wallpaper Switcher

A lightweight PowerShell script for changing your Windows desktop wallpaper. It can either rotate wallpapers sequentially or choose one at random each time it runs.

## Features

- Automatically detects supported image files
- Sequential or random wallpaper selection
- Remembers the last wallpaper when using sequential mode
- Custom wallpaper folder via command-line parameter
- Automatically creates and maintains the state file
- Validates wallpaper files before applying them
- Modular, production-style PowerShell code
- No configuration required when adding or removing wallpapers
- Can be launched manually, from Task Scheduler, or with a keyboard shortcut

## Supported Formats

- `.jpg`
- `.jpeg`
- `.png`
- `.bmp`
- `.gif`
- `.webp`
- `.tif`
- `.tiff`

## Folder Structure

Example:

```text
C:\Backgrounds\
│
├── Wallpaper.ps1
├── state.txt              (created automatically)
├── wallpaper1.jpg
├── wallpaper2.png
├── wallpaper3.webp
├── wallpaper4.gif
└── ...
```

## Installation

1. Create a folder for your wallpapers.

```text
C:\Backgrounds
```

2. Copy `Wallpaper.ps1` into the folder.

3. Add your wallpaper images.

The script will automatically detect all supported images.

## Usage

### Sequential mode (default)

```powershell
powershell.exe -ExecutionPolicy Bypass -File "C:\Backgrounds\Wallpaper.ps1"
```

### Random mode

```powershell
powershell.exe -ExecutionPolicy Bypass -File "C:\Backgrounds\Wallpaper.ps1" -Random
```

### Custom wallpaper folder

```powershell
powershell.exe -ExecutionPolicy Bypass -File "C:\Backgrounds\Wallpaper.ps1" -Folder "D:\Wallpapers"
```

### Random mode with custom folder

```powershell
powershell.exe -ExecutionPolicy Bypass -File "C:\Backgrounds\Wallpaper.ps1" -Folder "D:\Wallpapers" -Random
```

## Command-Line Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `-Folder` | Folder containing wallpaper images | `C:\Bakgrunner` |
| `-Random` | Select a random wallpaper instead of rotating sequentially | Disabled |

## Keyboard Shortcut

1. Create a shortcut that runs:

```text
powershell.exe -ExecutionPolicy Bypass -File "C:\Backgrounds\Wallpaper.ps1"
```

Or for random mode:

```text
powershell.exe -ExecutionPolicy Bypass -File "C:\Backgrounds\Wallpaper.ps1" -Random
```

2. Right-click the shortcut and select **Properties**.

3. Click the **Shortcut key** field.

4. Press your preferred key combination (for example):

```text
Ctrl + Alt + W
```

5. Click **OK**.

Now pressing the shortcut will change your wallpaper instantly.

## How It Works

1. Scans the selected folder for supported image files.
2. Sorts wallpapers alphabetically.
3. In sequential mode, reads the current index from `state.txt`.
4. Applies the selected wallpaper using the Windows API.
5. Saves the next wallpaper index for the next execution.
6. In random mode, selects a random wallpaper without modifying the saved index.

## Project Structure

| File | Description |
|------|-------------|
| `Wallpaper.ps1` | Main PowerShell script |
| `state.txt` | Automatically stores the current wallpaper index |
| `README.md` | Project documentation |

## Requirements

- Windows 10 or Windows 11
- PowerShell 5.1 or PowerShell 7+
- Permission to run PowerShell scripts (`ExecutionPolicy Bypass` or an appropriate execution policy)

## License

This project is released under the MIT License.

Feel free to use, modify, and distribute it.
