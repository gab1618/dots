//@ pragma UseQApplication

import Quickshell
import qs.services
import QtQuick

Scope {
  id: shell

  Pokemon {}
  Menu {}
  Bar {}

  Timer {
    interval: 0
    running: true
    repeat: false
    onTriggered: Wallpaper.updateWallpaper()
  }
}
