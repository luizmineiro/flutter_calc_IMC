// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultadoIMC = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 20),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Preencha os campos para calcular o IMC',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerPeso,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Digite seu peso",
                  label: Text('Peso *'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerAltura,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Digite sua altura",
                  label: Text('Altura *'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                resultadoIMC,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      num numAux = (num.parse(controllerPeso.text) /
                          (num.parse(controllerAltura.text) *
                              num.parse(controllerAltura.text)));
                      resultadoIMC = numAux.toStringAsFixed(2);
                    });
                  },
                  child: const Text(
                    'Calcular',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('X'),
        onPressed: () {
          setState(() {
            controllerAltura.clear();
            controllerPeso.clear();
            resultadoIMC = '';
          });
        },
      ),
    );
  }
}
