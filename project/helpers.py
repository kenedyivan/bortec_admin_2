from PyQt5.QtWidgets import QMessageBox


def notification(message):
    msg = QMessageBox()
    msg.setIcon(QMessageBox.Information)

    msg.setText(message)
    msg.setWindowTitle("Notifications")
    retval = msg.exec_()