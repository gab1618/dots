import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Qt.labs.folderlistmodel
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Widgets

import qs.config
import qs.services

PopupWindow {
  id: picker

  readonly property var colsCount: 2
  readonly property var imageWidth: 220
  readonly property var imageHeight: 120
  readonly property var gridHSpacing: 20
  readonly property var gridVSpacing: 20
  readonly property var contentPadding: 12

  anchor.window: bar
  anchor.rect.x: 4
  anchor.rect.y: parentWindow.height

  visible: false

  implicitWidth: (contentPadding * 2) + colsCount * (imageWidth + gridHSpacing)
  implicitHeight: 400

  color: "#00000000"

  FolderListModel {
    id: folderModel
    folder: Qt.resolvedUrl(`${Quickshell.shellDir}/assets/wallpapers`)
    showDirs: false
  }

  Rectangle {
    anchors.fill: parent
    radius: 12
    color: "#1e1e2e"

    GridView {
      id: grid
      anchors.fill: parent
      anchors.margins: contentPadding

      cellWidth: imageWidth + gridHSpacing
      cellHeight: imageHeight + gridVSpacing

      model: folderModel

      delegate: RowLayout {
        width: grid.cellWidth
        height: grid.cellHeight
        clip: true
        Layout.alignment: Qt.AlignHCenter

        Rectangle {
          width: imageWidth
          height: imageHeight
          color: "#00000000"

          Layout.leftMargin: gridHSpacing / 2
          Layout.rightMargin: gridHSpacing / 2

          ClippingWrapperRectangle {
            radius: 12
            anchors.fill: parent

            Image {
              anchors.fill: parent
              source: "file://" + filePath
              fillMode: Image.PreserveAspectCrop
            }
          }

          MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true

            onClicked: {
              Wallpaper.setWallpaper(filePath)
              picker.visible = false
            }
            onEntered: {
              Wallpaper.overrideWallpaper(filePath)
            }
            onExited: {
              Wallpaper.updateWallpaper()
            }
          }
        }
      }
    }
  }
}
