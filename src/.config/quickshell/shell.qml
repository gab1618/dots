//@ pragma UseQApplication

import Quickshell
import qs.services
import qs.components.menus
import QtQuick

Scope {
  id: shell

  Pokemon {}
  Menu {}
  WallpaperPicker {}

  Timer {
    interval: 0
    running: true
    repeat: false
    onTriggered: Wallpaper.updateWallpaper()
  }
}
