import 'package:flutter/material.dart';
import 'second_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'HTTP',
    home: App(),
  ));
}

class App extends StatelessWidget {
  int id = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('navigate'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage(id)));
            }),
      ),
    );
  }
}
