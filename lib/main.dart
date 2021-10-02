import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trabalho PPM - Calculadora IMC Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Trabalho PPM - Calculadora IMC Flutter'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _imc = 0;
  String _classificacao = "";

  final peso = TextEditingController();
  final altura = TextEditingController();

  _calcularICM() {
    setState(() {
      try {
        _imc = double.parse((double.parse(peso.text) /
                (double.parse(altura.text) * double.parse(altura.text)))
            .toStringAsFixed(2));
        if (_imc < 16) {
          _classificacao = "Magreza Grave";
        } else if (_imc >= 16 && _imc < 17) {
          _classificacao = "Magreza Moderada";
        } else if (_imc >= 17 && _imc < 18.5) {
          _classificacao = "Magreza Leve";
        } else if (_imc >= 18.5 && _imc < 25) {
          _classificacao = "Saudável";
        } else if (_imc >= 25 && _imc < 30) {
          _classificacao = "Sobrepeso";
        } else if (_imc >= 30 && _imc < 35) {
          _classificacao = "Obesidade grau I";
        } else if (_imc >= 35 && _imc < 40) {
          _classificacao = "Obesidade grau II (severa)";
        } else if (_imc > 40) {
          _classificacao = "Obesidade grau III (mórbida)";
        }
      } catch (e) {
        print("Não foi possível converter os dados passados.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: "Peso (KG)"),
            keyboardType: TextInputType.number,
            controller: peso,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Altura (Metros)"),
            keyboardType: TextInputType.number,
            controller: altura,
          ),
          TextButton(
              onPressed: _calcularICM,
              child: Text("Calcular IMC"),
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.blue)),
          Text("Seu IMC é: " + _imc.toString()),
          RichText(
            text: new TextSpan(
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(text: 'Está classificado como: '),
                new TextSpan(
                    text: _classificacao,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0)),
              ],
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
