import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Qt.labs.folderlistmodel
import Quickshell.Hyprland
import Quickshell.Io

import qs.config
import qs.services

PopupWindow {
    id: picker

    anchor.window: bar
    anchor.rect.x: 4
    anchor.rect.y: parentWindow.height

    visible: false

    implicitWidth: 600
    implicitHeight: 400
    color: "#00000000"

    FolderListModel {
      id: folderModel
      folder: Qt.resolvedUrl(`${Quickshell.shellDir}/assets/wallpapers`)
      showDirs: false
    }

    Rectangle {
        anchors.fill: parent
        radius: 10
        color: "#1e1e2e"

        GridView {
            id: grid
            anchors.fill: parent
            anchors.margins: 12

            cellWidth: 180
            cellHeight: 110

            model: folderModel

            delegate: Rectangle {
                width: 160
                height: 90
                radius: 6
                clip: true

                Image {
                    anchors.fill: parent
                    source: "file://" + filePath
                    fillMode: Image.PreserveAspectCrop
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
