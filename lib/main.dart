import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora - IMC',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const CalculadoraIMCPage(),
    );
  }
}
class CalculadoraIMC{
  double calcularIMC(double peso, double altura){
    return peso / (altura * altura);
  }
}
class CalculadoraIMCPage extends StatefulWidget{
  const CalculadoraIMCPage({super.key});

  @override
  _CalculadoraIMCPageState createState() => _CalculadoraIMCPageState();
  
}
class _CalculadoraIMCPageState extends State<CalculadoraIMCPage>{
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  double resultadoIMC = 0.0;

  void calcularIMC(){
    double peso = double.tryParse(pesoController.text)?? 0.0;
    double altura = double.tryParse(alturaController.text) ?? 0.0;

    setState((){
      resultadoIMC = CalculadoraIMC().calcularIMC(peso,altura);
    });
  }

@override
  Widget build (BuildContext context){
  return Scaffold(
    appBar : AppBar(
      title: const Text('Calculadora IMC', style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      )),
      backgroundColor: Colors.amber,
      centerTitle: true,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          const Icon(Icons.fitness_center, size: 128),

          const SizedBox(height: 24),

          TextField(
            controller: alturaController,
            keyboardType: TextInputType.number,
            decoration: 
              const InputDecoration(
                labelText: "Altura (m)",
                hintText: "Digite a sua altura:",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber)
              ),
            )
          ),

          const SizedBox(height: 24),

          TextField(
            controller:pesoController,
            decoration: 
              const InputDecoration(
                labelText: "Peso (kg)",
                hintText: "Digite o seu peso:",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber)
              ),
            )
          ),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: calcularIMC,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.amber),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ))
            ),
            child: const Text('Calcular IMC', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ))
          ),

          const SizedBox(height: 24),

          Text('O cálculo do seu IMC é: ${resultadoIMC.toStringAsFixed(2)}'),

          ]
        ),
      ),
    );
  }
}