import 'package:flutter/material.dart';


class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required this.msges}) : super(key: key);

  final String msges;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: AlertDialog(
          title: Text(
            "Error !",
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.red
            ),
          ),
          content: Text(msges),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("cancel")
            )
          ],
        ),
      ),
    );
  }
}
