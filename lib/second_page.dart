import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'users_model.dart';

Future<UserModel> fetchUser() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/1');
  if (response.statusCode == 200) {
    return UserModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class SecondPage extends StatefulWidget {
  SecondPage(this.id);
  int id;
  @override
  _State createState() => _State();
}

class _State extends State<SecondPage> {
  //List<UserModel> users;
  Future<UserModel> future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<UserModel>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
