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
        ),
//
        loading
            ? Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  'Pegando seus sorvetinhos...',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(156, 201, 0, 117)),
                ),
              )
            : Container(),

        //
        loading
            ? CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
              )
            : Container(),

        !loading
            ? Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: Text('Tentar novamente'),
                  onPressed: () {},
                ))
            : Container(),
      ],
    )));
  }
}
