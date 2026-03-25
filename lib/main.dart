//import material
import 'package:flutter/material.dart';

//etapa 1- esqueleto da tela
//objetivo: entender a estrutura de um app flutter

void main() => runApp(MaterialApp(
  home: ChurrascoApp(),
));

class ChurrascoApp extends StatelessWidget{
 
 String _resultado = "";
 void _calcular(){
  
 }
 
  @override
  Widget build(BuildContext context){
    // esqueleto visual da tela com a tag <html>
    return Scaffold( 
      // local na onde ficaram a maioria dos nossos elementos
      
      // semelhante ao header
      appBar: AppBar(
        title: Text("Calculadora de churras"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            //aqui é onde estaram os nossos elementos/widgets
            Text(
              "Bem-vindo á Calculadora de Churrasco",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 36),

             Text(
              "Enforme o número de convidados:",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            
            //Mulheres
            TextField(
              decoration: InputDecoration(
                labelText: "Quantidade de Mulheres:",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16,),
            //Homens
            TextField(
              decoration: InputDecoration(
                labelText: "Quantidade de Homens:",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: _calcular,
              child: Text("Calcular"),
            ),
            SizedBox(height: 36),
            Text(
              _resultado,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}