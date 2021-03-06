import QtQuick 2.0
import QtQuick.Controls 1.4 as Controls

import org.qfield 1.0
import "js/style.js" as Style

Item {
  property alias model: table.model
  signal finished

  Rectangle {
    anchors.fill: parent
    color: "white"
  }

  Controls.TableView {
    id: table
    anchors { left: parent.left; right: parent.right; bottom: parent.bottom; top: infoLabel.bottom }

    Controls.TableViewColumn {
      role: "LayerName"
      title: qsTr( "Layer Name" )
      width: 200 * dp
    }

    Controls.TableViewColumn {
      role: "DataSource"
      title: qsTr( "Data Source" )
      width: table.width - 200 * dp
    }
  }

  Controls.Label {
    id: infoLabel
    anchors { left: parent.left; right: parent.right; top: toolbar.bottom; margins: 4 * dp }
    text: qsTr( "The following layers could not be loaded.
Please review them and reconfigure the QGIS project.
You may check the <i>Portable Project</i> section in the QField documentation.")
    textFormat: Text.RichText
    wrapMode: Text.WordWrap
  }

  /** The title toolbar **/
  Rectangle {
    id: toolbar

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top

    height: visible ? 48 * dp : 0

    Controls.Label {
      id: titleLabel
      anchors { right: parent.right; left: closeButton.right }
      height: closeButton.height
      text: qsTr( 'Unable to load some layers' )
      font.bold: true
      horizontalAlignment: Text.AlignHCenter
    }

    Button {
      id: closeButton
      anchors.left: parent.left

      width: 48 * dp
      height: 48 * dp

      iconSource: Style.getThemeIcon( "ic_close_white_24dp" )

      onClicked: {
        finished()
      }
    }
  }
}
