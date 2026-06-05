import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell

import qs.config

Rectangle {
  readonly property var hPadding: 16

  implicitWidth: clock.implicitWidth
  Layout.fillHeight: true

  color: Theme.base1

  radius: height / 2

  SystemClock {
    id: clockservice
    precision: SystemClock.Seconds
  }

  Label {
    id: clock

    text: Qt.formatDateTime(clockservice.date, "  dd ddd 󰅐 HH:mm")
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    leftPadding: hPadding
    rightPadding: hPadding
    verticalAlignment: Text.AlignVCenter
    color: Theme.green

    font {
      family: bar.fontFamily;
      pixelSize: bar.fontSize;
      weight: 500;
    }
  }
}
