import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class PreloadPage extends StatefulWidget {
  const PreloadPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
  bool loading = true;

  void requestInfo() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      loading = true;
    });
    bool req = await Provider.of<AppData>(context, listen: false).requestData();
    if (req) {
      //go to home
      print('deu certo, puxando infos');
      Navigator.pushNamed(context, '/home');
    } else {
      //set loading false
      print('deu ruim, algo deu errado');
      loading = false;
    }
  }

  @override
  void initState() {
    super.initState();

    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
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
            ? const CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
              )
            : Container(),

        !loading
            ? Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: const Text('Tentar novamente'),
                  onPressed: () {},
                ))
            : Container(),
      ],
    )));
  }
}
