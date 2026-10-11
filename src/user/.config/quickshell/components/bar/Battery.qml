import Quickshell.Services.UPower
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

  readonly property var powerPercentage: UPower.displayDevice.percentage

  function getBatteryColor() {
    if(powerPercentage < 0.3) {
      return theme.red
    }
    if(powerPercentage < 0.7) {
      return theme.yellow
    }
    return Theme.green
  }

  readonly property var batteryIcons: ["󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
  function getBatteryIcon() {
    const iconIndex = Math.round(powerPercentage * 10) - 1

    return batteryIcons[iconIndex]
  }

  function getChargingIcon() {
    if(UPower.onBattery) return ""
    return " "
  }

  Label {
    id: clock

    text: `${getChargingIcon()}${getBatteryIcon()} ${powerPercentage * 100}%`
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    leftPadding: hPadding
    rightPadding: hPadding
    verticalAlignment: Text.AlignVCenter
    color: getBatteryColor()

    font {
      family: bar.fontFamily;
      pixelSize: bar.fontSize;
      weight: 500;
    }
  }
}
