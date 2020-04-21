

import 'package:flutter/material.dart';


class CuadradoAnimadoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado()
     ),
   );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  

  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {

AnimationController controller;
//animaciones
Animation<double> desplazarDerecha;
Animation<double> desplazarArriba;
Animation<double> desplazarIzquierda;
Animation<double> desplazarAbajo;

@override
  void initState() {
  //inicializar todo

  controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4500));
    

   desplazarDerecha = Tween(begin: 0.0, end: 150.0).animate(
     CurvedAnimation(parent: controller , curve:  Interval(0, 0.25,curve: Curves.bounceOut))
   );
   desplazarArriba = Tween(begin: 0.0, end: 150.0).animate(
     CurvedAnimation(parent: controller , curve:  Interval(0.26, 0.5,curve: Curves.bounceOut))
   );
   desplazarIzquierda = Tween(begin: 0.0, end: 150.0).animate(
     CurvedAnimation(parent: controller , curve:  Interval(0.51, 0.75,curve: Curves.bounceOut))
   );
   desplazarAbajo = Tween(begin: 0.0, end: 150.0).animate(
     CurvedAnimation(parent: controller , curve:  Interval(0.76, 1.0,curve: Curves.bounceOut))
   );

   controller.addListener((){
   if(controller.status == AnimationStatus.completed){
      //  controller.reverse();
       controller.reset();
      //  controller.repeat();
     }

   });

   super.initState();

  }

  @override
  void dispose() {
   controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward();

    return AnimatedBuilder(
      animation: controller, 
      child:_Rectangulo() ,
      builder: (BuildContext context, Widget child) {
        
        return Transform.translate(
          offset: Offset(desplazarDerecha.value, 0),
          child: Transform.translate(
            offset: Offset(0, - desplazarArriba.value),
            child: Transform.translate(
              offset: Offset(- desplazarIzquierda.value, 0),
              child: Transform.translate(
                offset: Offset(0, desplazarAbajo.value),
                child: child),
              ),
            ),
        );
      },
      

    );
    
    
  }
}
class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}