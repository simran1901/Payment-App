import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  static String routeName = '/screen3';
  const Screen3(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
