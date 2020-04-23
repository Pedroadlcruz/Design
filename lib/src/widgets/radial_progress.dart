import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


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
//  final Offset center = new Offset(size.width * 0.5, size.height / 2);
   final double radius  = min(size.width * 0.5 , size.height * 0.5);
   final pointMode = ui.PointMode.points;
  

   Offset pointCircle(double t) {

    double dx = size.width * 0.5 + radius * cos(1.3527 + pi - t * (pi/180));
    double dy = size.height * 0.5 + radius * sin(1.3527 + pi - t * (pi/180));

     return Offset(dx, dy);
   }

   List<Offset> pointList(double cant) {
     
     double p ;
     List<Offset> points = [];

     for (var i = 0; i <= cant; i++) {
       p = 12.0 * i;
        print(p);
      points.add(pointCircle(p)) ;
     }
    
      return points;
 }
   

//Circulo Completado
    final paint = new Paint()
    ..strokeWidth = grosorSecundario
    ..color       = colorSecundario
    ..strokeCap   = StrokeCap.round
    ..style       = PaintingStyle.stroke;

   final pointsBase = pointList(30);

    // canvas.drawCircle(center, radius, paint);
    canvas.drawPoints(pointMode, pointsBase, paint);

    //Arco
    final paintArc = new Paint()
    ..strokeWidth = grosorPrimario
    ..color       = colorPrimario
    ..strokeCap   = StrokeCap.round
    ..style       = PaintingStyle.stroke;



  // final pointMode = ui.PointMode.points;
  final points = pointList(porcentaje);
 
  canvas.drawPoints(pointMode, points, paintArc);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}