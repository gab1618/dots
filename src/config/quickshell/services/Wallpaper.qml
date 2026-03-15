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
  }


  function setWallpaper(fullPath: string) {
    currentpaper.setText(fullPath)
  }
  function updateWallpaper() {
    currentpaper.waitForJob()
    overrideWallpaper(wallpaperPath)
  }
  function overrideWallpaper(fullPath: string) {
    setWallpaperProc.exec(["hyprctl", "hyprpaper", "wallpaper", `,${fullPath}`])
  }
}
