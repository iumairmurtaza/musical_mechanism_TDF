import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import 'package:musical_mechanism/instrument.dart';
import 'constants.dart';
import 'package:flutter/services.dart';



void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      // title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Aerophones',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('      Musical Mechanism',),
      ),
      body:
          InstrumentPage(),

    );
  }
}
