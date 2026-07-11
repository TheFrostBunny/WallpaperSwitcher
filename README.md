# Wallpaper Switcher

A simple PowerShell script that cycles through all wallpapers in a folder each time it is run.

## Features

* Automatically detects all supported wallpaper images in the folder
* Cycles through wallpapers in alphabetical order
* Remembers the last wallpaper used
* Supports:

  * `.jpg`
  * `.jpeg`
  * `.png`
  * `.bmp`
* No need to edit the script when adding or removing wallpapers
* Can be launched manually, from Task Scheduler, or with a keyboard shortcut

## Folder Structure

Place the following files in the same folder:

```
C:\Backgrounds\
│
├── toggle.ps1
├── state.txt          (created automatically)
├── wallpaper1.jpg
├── wallpaper2.png
├── wallpaper3.bmp
└── ...
```

## Installation

1. Create the folder:

```
C:\Backgrounds
```

2. Copy `toggle.ps1` into the folder.

3. Add your wallpaper images to the folder.

That's it—the script automatically finds all supported images.

## Running the Script

Run from PowerShell:

```powershell
powershell.exe -ExecutionPolicy Bypass -File "C:\Backgrounds\toggle.ps1"
```

Or simply double-click a shortcut that runs the command above.

## Keyboard Shortcut

1. Create a shortcut that runs:

```text
powershell.exe -ExecutionPolicy Bypass -File "C:\Backgrounds\toggle.ps1"
```

2. Right-click the shortcut and select **Properties**.

3. Click the **Shortcut key** field.

4. Press your preferred key combination (for example):

```
Ctrl + Alt + W
```

5. Click **OK**.

Now pressing the shortcut will switch to the next wallpaper.

## How It Works

* The script scans `C:\Backgrounds` for supported image files.
* Images are sorted alphabetically.
* The current wallpaper index is stored in `state.txt`.
* Each time the script runs, the next wallpaper is selected.

## Supported Formats

* JPG
* JPEG
* PNG
* BMP

## Files

| File         | Description                                      |
| ------------ | ------------------------------------------------ |
| `toggle.ps1` | Main PowerShell wallpaper switcher               |
| `state.txt`  | Automatically stores the current wallpaper index |
| `README.md`  | Documentation                                    |

## License

This project is free to use, modify, and distribute.
