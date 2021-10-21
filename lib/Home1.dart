import 'package:flutter/material.dart';

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    setState(() {
      if (precoAlcool == null || precoGasolina == null) {
        _textoResultado = "Número inválido! digite numeros maiores que 0 sempre utilizando pontos (.)";
      } else if((precoAlcool / precoGasolina) >= 0.7){
        _textoResultado = "Melhor usar GASOLINA";
      }else{
        _textoResultado = "Melhor usar Álcool";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou Gasolina",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w300, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Image.asset("image/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  "Qual a melhor opção para abastecer agora? Digite abaixo os valores :)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço do Álcool, ex 1.59",
                      labelStyle: TextStyle(color: Colors.green, fontSize: 18)),
                  style: TextStyle(fontSize: 22),
                  controller: _controllerAlcool,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço da Gasolina, ex 2.49",
                      labelStyle: TextStyle(color: Colors.red, fontSize: 18)),
                  style: TextStyle(fontSize: 22),
                  controller: _controllerGasolina,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  onPressed: _calcular,
                  child: Text("Calcular", style: TextStyle(fontSize: 20)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
