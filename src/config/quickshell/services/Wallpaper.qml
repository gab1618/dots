pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  FileView {
    id: currentpaper
    path: Qt.resolvedUrl(`${Quickshell.shellDir}/.state/current-wallpaper`)
    watchChanges: true
    blockLoading: true

    onFileChanged: {
      updateWallpaper()
    }
  }

  readonly property var wallpaperPath: currentpaper.text()

  Process {
    id: setWallpaperProc
    running: false
    command: ["hyprctl", "hyprpaper", "wallpaper", `,${wallpaperPath}`]
  }

  function setWallpaper(fullPath: string) {
    currentpaper.setText(fullPath)
  }
  function updateWallpaper() {
    currentpaper.waitForJob()
    setWallpaperProc.command = ["hyprctl", "hyprpaper", "wallpaper", `,${wallpaperPath}`]
    setWallpaperProc.running = true
  }
}
