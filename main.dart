import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'userpage.dart';
import 'adminpage.dart';
bool isLoading = false;

void main() {
  runApp(MaterialApp(
    home: splash_screen(),
    debugShowCheckedModeBanner: false,
  ));
}

class splash_screen extends StatefulWidget {
  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.white,
      image: Image.asset('images/logo.jpg'),
      loaderColor: Colors.black,
      photoSize: 200.0,
      navigateAfterSeconds: mainPage(),
    );
  }
}

class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("CHARUSAT"),
        ),
        body:Center(
          child: Container(
    child: Column(
    children: <Widget>[
      RaisedButton(

    onPressed:(){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => viewWholeData()),
      );
    },
          textColor: Colors.white,
          color: Colors.black,
          padding: const EdgeInsets.all(8.0),
    child: Text("Admin"),
    ),
    RaisedButton(
    onPressed: (){

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => drop_down()),
      );
    },
      textColor: Colors.white,
      color: Colors.black,
      padding: const EdgeInsets.all(8.0),
    child: Text("User"),
    )
    ],
    ),
    ),
        )
    );
  }
}



