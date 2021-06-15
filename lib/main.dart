import 'package:flutter/material.dart';

import './screens/screen2.dart';
import './screens/screen1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payments App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(46, 43, 105, 1),
      ),
      home: MyHomePage(),
      routes: {
        Screen1.routeName: (context)=> Screen1(),
        Screen2.routeName: (context)=> Screen2(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payments App'),),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) return Colors.grey;
                return Theme.of(context).primaryColor; 
              },
            ),
          ),
          child: Text('Dashboard'),
          onPressed: () {
            Navigator.of(context).pushNamed(Screen1.routeName);
          },
        ),
      ),
    );
  }
}
