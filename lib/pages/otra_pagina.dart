import 'package:flutter/material.dart';

class OtraPagina extends StatefulWidget {
  const OtraPagina({Key? key}) : super(key: key);

  @override
  State<OtraPagina> createState() => _OtraPaginaState();
}

class _OtraPaginaState extends State<OtraPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Principal',
          style: TextStyle(fontSize: 15.0),
        ),
      ),
    );
  }
}
