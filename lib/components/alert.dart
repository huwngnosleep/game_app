import 'package:flutter/material.dart';

class Alert {
  Future<void> alert(String title, String subtile, BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:
                Padding(padding: const EdgeInsets.all(8.0), child: Text(title)),
            content: Text(subtile),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK")),
            ],
          );
        });
  }
}
