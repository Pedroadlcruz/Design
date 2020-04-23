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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomRadialProgress(porcentaje: porcentaje, color: Colors.red,color2: Colors.black, tamano: 220, punto: 15, icon: false, image: true,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //     CustomRadialProgress(porcentaje: porcentaje, color: Colors.blueAccent,),
          //     CustomRadialProgress(porcentaje: porcentaje, color: Colors.blueAccent,),
          //   ],
          // ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.purple, color2: Colors.transparent, color3: Colors.yellowAccent.withOpacity(0.5), icon: true,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blueAccent, icon: false,color3: Colors.pink.withOpacity(0.5), relation: true,),
            ],
          ),
          SizedBox(height: 20,),
          CustomRadialProgress(porcentaje: porcentaje, color: Colors.yellow,color2: Colors.black54,tamano: 250, punto2: 20, punto: 15, icon: false,porcent: true,),
        ],
      )
   );
  }
}

class CustomRadialProgress extends StatelessWidget { 

   final double porcentaje;
   final Color color;
   final Color color2;
   final Color color3;
   final double tamano;
   final double punto;
   final double punto2;
   final bool icon;
   final bool image;
   final bool porcent;
   final bool relation;

  CustomRadialProgress({
   
    @required this.porcentaje, 
    @required this.color, 
              this.color2 = Colors.grey,
              this.tamano  = 150, 
              this.punto = 10.0, 
              this.punto2 = 4.0, 
              this.icon = false, 
              this.color3 = Colors.lightGreenAccent, 
              this.image = false, 
              this.porcent = false, 
              this.relation = false, 
              
  });

 

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  tamano,
      height: tamano,
      // color: Colors.red,
      child: Stack(
        children: <Widget>[
          RadialProgress(porcentaje: porcentaje,
           colorPrimario: color,
           colorSecundario: color2,
           grosorSecundario: punto2,
           grosorPrimario:punto,
           ),
           
           Center(
             child: Container(
               width: tamano - 45,
               decoration: BoxDecoration(
                 color: color3,
                 shape: BoxShape.circle
               ),
             )
           ),
           if(this.porcent)
           Center(
           child: Text('${((porcentaje/30)*100).toInt()}%', style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700),),
           ),
           if(this.icon)
           Center(
           child: Icon(Icons.timer, size: 60,),
           ),
           if(this.image)
          Center(
           child: Image.network('https://cdn0.iconfinder.com/data/icons/sport-achievment-badges/128/sport_badges-10-512.png', fit: BoxFit.cover, width: tamano -35,),
           ),
           if(this.relation)
           Center(
           child: Text('${porcentaje.toInt()}/30', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700), ),
           ),
        ],
      ),
      // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0),)
      );
  }
}

// Colors.redAccent.withOpacity(0.3)