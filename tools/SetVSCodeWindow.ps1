Function Set-Window {
  [cmdletbinding()]
  Param (
    [String]$ProcessName,
    [int]$Width,
    [int]$Height
  )
  Begin {
    Try{
        [void][Window]
    } Catch {
    Add-Type @"
      using System;
      using System.Runtime.InteropServices;
      public class Window {
        [DllImport("user32.dll")]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);

        [DllImport("User32.dll")]
        public extern static bool MoveWindow(IntPtr handle, int x, int y, int width, int height, bool redraw);
      }
      public struct RECT
      {
        public int Left;        // x position of upper-left corner
        public int Top;         // y position of upper-left corner
        public int Right;       // x position of lower-right corner
        public int Bottom;      // y position of lower-right corner
      }
"@
    }
  }
  Process {
    $Rectangle = New-Object RECT
    $Handle = (Get-Process -Name 'Code' | Where-object { $_.MainWindowHandle -ne 0 } | Select-Object -First 1).MainWindowHandle
    $Return = [Window]::GetWindowRect($Handle,[ref]$Rectangle)
    if ($null -eq $Return) { return }
    $Return = [Window]::MoveWindow($Handle, $Rectangle.Left, $Rectangle.Top, $Width + 4, $Height + 4,$True) # +4px for window chrome
  }
}

# Resize a VS Code window to the correct size for capturing screencasts
Set-Window -Process 'Code' -Width 1200 -Height 750
