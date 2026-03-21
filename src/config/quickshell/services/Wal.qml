pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: wal
  readonly property string home: Quickshell.env("HOME")

  FileView {
    id: walcolors
    path: Qt.resolvedUrl(`${home}/.cache/wal/colors.json`)
    watchChanges: true
    blockLoading: true
  }

  readonly property var walData: JSON.parse(walcolors.text())

  property string bg: walData.special.background
  property string fg: walData.special.foreground

  property string color0: walData.colors.color0
  property string color1: walData.colors.color1
  property string color2: walData.colors.color2
  property string color3: walData.colors.color3
  property string color4: walData.colors.color4
  property string color5: walData.colors.color5
  property string color6: walData.colors.color6
  property string color7: walData.colors.color7
  property string color8: walData.colors.color8
  property string color9: walData.colors.color9
  property string color10: walData.colors.color10
  property string color11: walData.colors.color11
  property string color12: walData.colors.color12
  property string color13: walData.colors.color13
  property string color14: walData.colors.color14
  property string color15: walData.colors.color15
}
