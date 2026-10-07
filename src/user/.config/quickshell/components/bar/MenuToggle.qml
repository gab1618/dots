import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.config
import qs.components.menus

Rectangle {
  readonly property var hPadding: 16

  implicitWidth: icon.implicitWidth
  Layout.fillHeight: true

  color: Theme.base1

  radius: height / 2

  Label {
    id: icon
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    leftPadding: hPadding
    rightPadding: hPadding

    verticalAlignment: Text.AlignVCenter

    text: "󰣇"
    color: Theme.blue

    font {
      pixelSize: 20
    }

    MouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor

      onClicked: {
        wallpaperpicker.visible = !wallpaperpicker.visible
      }
    }
  }

  WallpaperPicker {
    id: wallpaperpicker
  }
}
