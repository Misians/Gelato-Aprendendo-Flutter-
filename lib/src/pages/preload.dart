import 'package:flutter/material.dart';

class PreloadPage extends StatefulWidget {
  const PreloadPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'lib/assets/logo.png',
          width: 200,
        )
      ],
    )));
  }
}
