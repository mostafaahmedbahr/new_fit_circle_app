 import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String? title,
 String? message,
 void Function()? onPressed,
 ) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: onPressed,
  );
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

  // set up the AlertDialog

  AlertDialog alert = AlertDialog(
    title: Text(title!),
    content: Text(message!),
    actions: [
      okButton,
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}