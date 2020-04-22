import 'dart:math';

import 'package:flutter/material.dart';


class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  RadialProgress({ 
   @required this.porcentaje, 
            this.colorPrimario = Colors.blue, 
            this.colorSecundario = Colors.grey, 
            this.grosorSecundario = 4.0, 
            this.grosorPrimario = 10.0,
    }) ;

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{

AnimationController controller;
double porcentajeAnterior; 

@override
  void initState() {
    
   porcentajeAnterior = widget.porcentaje;
   controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));



    super.initState();
  }

@override
void dispose() {
  controller.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget child) {
        return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _MiRadialProgress( (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
        widget.colorPrimario,
        widget.colorSecundario,
        widget.grosorSecundario,
        widget.grosorPrimario,
        ),
        
      ),
    );
  },
);

    
  }
}

class _MiRadialProgress extends CustomPainter{

final porcentaje;
final Color colorPrimario;
final Color colorSecundario;
final double grosorSecundario;
final double grosorPrimario;

  _MiRadialProgress(
    this.porcentaje, 
    this.colorPrimario, 
    this.colorSecundario,
    this.grosorSecundario, 
    this.grosorPrimario,
    );


  @override
  void paint(Canvas canvas, Size size) {

  

//Circulo Completado
    final paint = new Paint()
    ..strokeWidth = grosorSecundario
    ..color       = colorSecundario
    ..style       = PaintingStyle.stroke;

   final Offset center = new Offset(size.width * 0.5, size.height / 2);
   final double radius  = min(size.width * 0.5 , size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    //Arco
    final paintArc = new Paint()
    ..strokeWidth = grosorPrimario
    ..color       = colorPrimario
    ..style       = PaintingStyle.stroke;

    //Parte que se debera ir llenn\ando
    double arcAngle =2 * pi * (porcentaje/100);
    canvas.drawArc(
    Rect.fromCircle(center:  center, radius: radius), 
     - pi / 2, 
    arcAngle, 
    false, 
    paintArc
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}