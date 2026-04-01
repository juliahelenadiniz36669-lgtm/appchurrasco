//import material
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//etapa 1- esqueleto da tela
//objetivo: entender a estrutura de um app flutter

void main() => runApp(MaterialApp(
  home: ChurrascoApp(),
));

class ChurrascoApp extends StatefulWidget{
  @override
  _ChurrascoAppState createState() => _ChurrascoAppState();
}

class _ChurrascoAppState extends State<ChurrascoApp>{

  final TextEditingController _homensController = TextEditingController();

  final TextEditingController _mulheresController = TextEditingController();
 
  String _resultado = "";

  // PALETA DE CORES- cor do fundo, cor primaria, cor segundaria, cor da borda, cor do card, cor da letra
  //RGB, HEX, NOME(GREE)
  static const Color corFundo = Color.fromARGB(255, 255, 224, 204);
  static const Color corCard = Color.fromARGB(255, 166, 104, 46);
  static const Color corPrimaria = Color.fromARGB(255, 231, 185, 154);
  static const Color corSegundaria = Color(0xFFFFB347);
  static const Color corTexto = Color(0xFFFFF0E0);
  static const Color corTextoCinza =Color(0xFFFFB347);
  static const Color corBorda = Color.fromARGB(255, 192, 132, 90);
  
  void _calcular(){
    final int homens = int.tryParse(_homensController.text) ?? 0;
    final int mulheres = int.tryParse(_mulheresController.text) ?? 0;
    if (homens < 0 || mulheres < 0) {
      setState(() {
        _resultado = "Informe ao menos uma pessoa";
      });
    return;
    }
    final double totalkg =(homens * 350 + mulheres * 300)/1000;
    setState(() {
      _resultado = 
                  '$totalkg kg de carne 🥩\n'
                  '${(totalkg * 0.3).toStringAsFixed(1)} kg de acompanhamento🍅🧅\n'
                  '${homens * 3 + mulheres * 3} unidades de bebida 🍹';
    });
    return;
  }

 
  @override
  Widget build(BuildContext context){
    // esqueleto visual da tela com a tag <html>
    return Scaffold( 
      // local na onde ficaram a maioria dos nossos elementos
       backgroundColor: corFundo,
      // semelhante ao header
      appBar: AppBar(
        backgroundColor: corCard,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "🔥Calculadora de churras",
          style: TextStyle(
            color: corSegundaria,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             SizedBox(height: 16),
            //aqui é onde estaram os nossos elementos/widgets
            
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: corCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: corBorda, width: 1),
              ),
              child:  Text(
              "Enforme o número de convidados:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(255, 234, 191, 157),
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 28),
          _buildCampo(
            controller: _mulheresController, 
            label: "Quantidade de mulheres", 
            icone: Icons.person,
            ),            
            
          SizedBox(height: 16),
          _buildCampo(
            controller: _homensController, 
            label: "Quantidade de homens", 
            icone: Icons.person_outline,
            ),    
            SizedBox(height: 16),

            ElevatedButton( 
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: corPrimaria,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 6,
                shadowColor: corPrimaria.withOpacity (0.5),
              ),
              child: Text(
              "Calcular",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
              ),
            ),
            
            ),
            
       

            if(_resultado.isNotEmpty)
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: corPrimaria,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                 color: corPrimaria,
                 width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                     color: corPrimaria.withOpacity(0.2),
                     blurRadius: 12,
                     offset: Offset(0, 4),
                  ),
                ]
              ),
              child: Column(children: [
                Text(
                  'Você vai precisar de:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: corPrimaria,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    height: 2.0,
                    color: corBorda,
                  ),
                )
              ],),
            ),
            SizedBox(height: 16,),
            Text(
              '350g por homem, 300gr por mulher',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
Widget _buildCampo({
  required TextEditingController controller,
  required String label,
  required IconData icone,
}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    style: TextStyle(color: corTexto, fontSize: 16),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: corTextoCinza),
      prefixIcon: Icon(icone, color: corPrimaria),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color:corBorda, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: corPrimaria, width: 2),
      ),
      filled: true,
      fillColor: corCard,
    ),
  );
}
}

