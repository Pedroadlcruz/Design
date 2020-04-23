import 'package:disenos/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';


class GraficasCircularesPage extends StatefulWidget {

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage>  {

double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            porcentaje ++;
            if (porcentaje > 30) {
              porcentaje = 0;
            }
          });
        },
        child: Icon(Icons.refresh),

      ),
      body: Center(
        child: CustomRadialProgress(porcentaje: porcentaje, color: Colors.blueAccent,),
      )
   );
  }
}

class CustomRadialProgress extends StatelessWidget { 

   final double porcentaje;
   final Color color;

  CustomRadialProgress({
   
    @required this.porcentaje, 
    @required this.color,
  });

 

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  350,
      height: 350,
      // color: Colors.red,
      child: RadialProgress(porcentaje: porcentaje,
       colorPrimario: color,
       colorSecundario: Colors.grey,
       grosorSecundario: 10,
       grosorPrimario: 15,
       ),
      // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0),)
      );
  }
}