import 'package:flutter/material.dart';

void main() {
  runApp(const Tep());
}



class Tep extends StatefulWidget {
  const Tep({Key? key}) : super(key: key);

  @override
  _TepState createState() => _TepState();
}

class _TepState extends State<Tep> {
  var controladorCorreo = TextEditingController();
  var controladorPassword = TextEditingController();
  var controladorNumero1 = TextEditingController();
  var controladorNumero2 = TextEditingController();

  var sesionAbierta = false;
  bool luzEncendida = false;
  String colorLuz = "";
  double intensidad = 1;
  Color coloract = Colors.blue;

  var numero1 = 0;
  var numero2 = 0;
  var result = 0;


  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(

        appBar: AppBar(title: Text("Controllers"),),
        body :Padding(
            padding: EdgeInsets.all(8.8),
            child:
            SingleChildScrollView(
              child:           Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: controladorNumero1,
                    decoration: InputDecoration(
                        icon: Icon(Icons.people),
                        labelText: "numero 1",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))


                    ),
                  ),
                  SizedBox( height: 20,),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: controladorNumero2,
                    decoration: InputDecoration(
                        icon: Icon(Icons.people),
                        labelText: "numero 2",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))


                    ),
                  ),

                  SizedBox( height: 20,),

                  Row(
                    children: [
                      Text("Desea mantener la sesion abierta ?"),

                      Checkbox(
                          value: sesionAbierta,
                          onChanged: (value) {
                            setState(() {
                              sesionAbierta = value!;
                              print(sesionAbierta);
                            });
                          }),
                    ],
                  ),

                  CheckboxListTile(
                    title: Text("¿Desea  mantener la sesión abierta?"),
                      value: sesionAbierta,
                      onChanged: (value){
                        setState(() {
                          sesionAbierta = value!;
                        });
                      }
                  ),

                  Row(
                    children: [
                      Text("Luz encendida"),
                      Switch(
                          value: luzEncendida,
                          onChanged: (value){
                            setState(() {
                              luzEncendida = value;
                            });
                          }
                      ),
                    ],
                  ),

                  SwitchListTile(
                    title: Text("Luz encendida"),
                      value: luzEncendida,
                      onChanged: (value){
                        setState(() {
                          luzEncendida = value;
                        });
                      }),
                  Text("Color de la luz"),

                  RadioListTile(
                      title: Text("Luz Roja"),
                      value: "Luz roja",
                      groupValue: colorLuz,
                      onChanged:  (value){setState(() {
                        colorLuz = value.toString();
                        print(colorLuz);
                      });
                      }),
                  RadioListTile(
                    title: Text("LuzVerde"),
                      value: "Luz verde",
                      groupValue: colorLuz,
                      onChanged:  (value){setState(() {
                        colorLuz = value.toString();
                        print(colorLuz);
                    });
                  }),
                  RadioListTile(
                      title: Text("Luz Azul"),
                      value: "Luz azul",
                      groupValue: colorLuz,
                      onChanged:  (value){setState(() {
                        colorLuz = value.toString();
                        print(colorLuz);
                      });
                      }),
                  Text("intensidad"),
                  Slider(
                      value: intensidad,
                      min: 1.0,
                      max: 3.0,
                      divisions: 2,
                      activeColor: coloract,
                      label: intensidad.toString(),
                      onChanged: (value){
                        setState(() {
                          intensidad = value;
                          print(intensidad);
                          intensidad >= 2 ?  coloract = Colors.red: coloract = Colors.blue ;

                        });
                      }),

                  SizedBox(
                      width:  double.infinity,
                      child: ElevatedButton(
                        child: Text("Sumar"),
                        onPressed: () {

                          setState(() {
                            numero1 = int.parse(controladorNumero1.text);
                            numero2 = int.parse(controladorNumero2.text) ;
                            result = numberReturn(numero1,numero2,1);
                          });
                        },
                      )
                  ),
                  SizedBox(
                      width:  double.infinity,
                      child: ElevatedButton(
                        child: Text("Restar"),
                        onPressed: () {

                          setState(() {
                            numero2 = int.parse(controladorNumero2.text);
                            numero1 = int.parse(controladorNumero1.text);
                            result = numberReturn(numero1,numero2,2);
                          });

                        },
                      )
                  ),
                  SizedBox(
                      width:  double.infinity,
                      child: ElevatedButton(
                        child: Text("Multilicar"),
                        onPressed: () {
                          setState(() {
                            numero2 = int.parse(controladorNumero2.text);
                            numero1 = int.parse(controladorNumero1.text);
                            result = numberReturn(numero1,numero2,3);
                          });
                        },
                      )
                  ),
                  SizedBox(
                      width:  double.infinity,
                      child: ElevatedButton(
                        child: Text("divir"),
                        onPressed: () {

                          setState(() {
                            numero2 = int.parse(controladorNumero2.text);
                            numero1 = int.parse(controladorNumero1.text);
                            result = numberReturn(numero1,numero2,4);
                          });


                        },
                      )
                  ),

                  Text("Valores...$result")


                ],
              ),
            )
        )


    ),
  );

  int numberReturn(int primer, int segundo, int operator) {
    int result = 0 ;
    switch (operator) {
    //suma
      case 1: {
        result = (primer + segundo) as int;
      }
      break;
    //resta
      case 2: {
        result = primer - segundo;
      }
      break;
    //multiplicar
      case 3: {
        result = primer * segundo;
      }
      break;
    //dividir
      case 4: {
        result =  (primer.toDouble() / segundo.toDouble()).toInt()  ;
      }

    }



    return result;
  }

}

