import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.components.bar

PanelWindow {
  id: bar

  visible: true

  property string fontFamily: "FiraCode Nerd Font"
  property int fontSize: 14

  anchors.top: true
  anchors.left: true
  anchors.right: true
  implicitHeight: 32
  color: "#00000000"


  RowLayout {
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    anchors.topMargin: 2
    anchors.leftMargin: 6
    anchors.rightMargin: 6

    Workspaces {}
  }

  RowLayout {
    anchors.centerIn: parent
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    anchors.topMargin: 2
    anchors.leftMargin: 6
    anchors.rightMargin: 6
  }

  RowLayout {
    spacing: 8

    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    anchors.topMargin: 2
    anchors.leftMargin: 6
    anchors.rightMargin: 6

    Mpris {}

    Tray {}

    Sound {}

    Clock {}
  }
}
