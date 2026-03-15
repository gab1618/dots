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

  property var overwritten: currentpaper.text()
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
    if(fullPath == overwritten) return
    overwritten = fullPath
    setWallpaperProc.exec(["hyprctl", "hyprpaper", "wallpaper", `,${fullPath}`])
  }
}
