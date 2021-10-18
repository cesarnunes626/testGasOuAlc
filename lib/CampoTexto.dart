import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(32),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite um valor",
                labelStyle: TextStyle(color: Colors.green, fontSize: 15)
              ),
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
              obscureText: true,
              onChanged: (String e){
                print("Valor digitado $e");
              },

            ),
          )
        ],
      ),
    );
  }
}
