import 'package:flutter/material.dart';
import 'package:front_archetype/src/utils/constants.dart';

class AlertUtil {

  static void showDialogAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext c) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(c).pop();
              },
              child: Text("Cerrar")
            )
          ],
        );
      }
    );
  }
  
}