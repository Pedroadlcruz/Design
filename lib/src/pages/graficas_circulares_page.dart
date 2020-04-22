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
            porcentaje +=10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
        child: Icon(Icons.refresh),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color:  Colors.blueAccent,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.redAccent,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.pinkAccent,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.purpleAccent,),
            ],
          ),
        ],
      ),
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
      width:  180,
      height: 180,
      // color: Colors.red,
      child: RadialProgress(porcentaje: porcentaje,
       colorPrimario: color,
       colorSecundario: Colors.black,
       grosorSecundario: 4,
       grosorPrimario: 10,
       ),
      // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0),)
      );
  }
}