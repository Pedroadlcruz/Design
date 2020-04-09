import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
      ),
      
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderDiagonalPainter(),
        ),
      );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path = new Path();

    //Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.5);



    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderTriangularPainter(),
        ),
      );
  }
}

class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path = new Path();

    //Dibujar con el path y el lapiz
    // path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);



    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderPico(),
        ),
      );
  }
}

class _HeaderPico extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //Propiedades
    lapiz.color = Colors.deepOrangeAccent;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 22;

    final path = new Path();

    //Dibujar con el path y el lapiz
    // path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.13);
    path.lineTo(size.width * 0.5, size.height * 0.20);
    path.lineTo(size.width , size.height * 0.13);
    path.lineTo(size.width , 0);
    // path.lineTo(size.width, size.height);
    
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);



    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderCurvo(),
        ),
      );
  }
}

class _HeaderCurvo extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //Propiedades
    lapiz.color = Colors.deepOrangeAccent;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 22;

    final path = new Path();

    //Dibujar con el path y el lapiz
    
    path.lineTo(0, size.height * 0.10);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40, size.width, size.height * 0.15);
    path.lineTo(size.width, 0);
   
    
    
    // path.lineTo(0, 0);
   

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderWavePainter(),
        ),
      );
  }
}

class _HeaderWavePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 22;

    final path = new Path();

    //Dibujar con el path y el lapiz
    
    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.05, size.width , size.height * 0.20);
    path.lineTo(size.width, 0);
   
    
    
    // path.lineTo(0, 0);
   

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderWave1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderWavePainter1(),
        ),
      );
  }
}

class _HeaderWavePainter1 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //Propiedades
    lapiz.color = Colors.black;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 22;

    final path = new Path();

    //Dibujar con el path y el lapiz
    path.moveTo(size.width * 0.55, 0);
    path.lineTo(size.width * 0.55, size.height * 0.03);
    path.quadraticBezierTo(size.width * 0.65, size.height * 0.3, size.width , size.height * 0.18);
    path.lineTo(size.width , 0);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.05, size.width , size.height * 0.20);
    // path.lineTo(size.width, 0);
   
    
    
    // path.lineTo(0, 0);
   

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderWave2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderWavePainter2(),
        ),
      );
  }
}

class _HeaderWavePainter2 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //Propiedades
    lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 22;

    final path = new Path();

    //Dibujar con el path y el lapiz
    path.moveTo(size.width * 0.7, 0);
    // path.lineTo(size.width * 0.55, size.height * 0.03);
    path.quadraticBezierTo(size.width * 0.85, size.height * 0.28, size.width , size.height * 0.21);
    path.lineTo(size.width , 0);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.05, size.width , size.height * 0.20);
    // path.lineTo(size.width, 0);
   
    
    
    // path.lineTo(0, 0);
   

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderWave3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderWavePainter3(),
        ),
      );
  }
}

class _HeaderWavePainter3 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //Propiedades
    lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 15;

    final path = new Path();

    Rect myRect = const Offset(1.0, 2.0) & const Size(3.0, 4.0);

    //Dibujar con el path y el lapiz
    // path.moveTo(size.width * 0.6, 0);

    path.addOval(myRect);
   
    // path.relativeCubicTo(size.width , size.height * 0.01, size.width , size.height * 0.5, size.width, size.height * 0);
  
    
    
    // path.lineTo(0, 0);
   

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderCurvo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderCurvoPainter1(),
        ),
      );
  }
}

class _HeaderCurvoPainter1 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //Propiedades
    lapiz.color = Colors.black87;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 12;

    final path = new Path();

    //Dibujar con el path y el lapiz
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.96);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.84, size.width  *0.65, size.height );
    path.lineTo(0, size.height);
   
    
    
    // path.lineTo(0, 0);
   

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderCurvo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderCurvoPainter2(),
        ),
      );
  }
}

class _HeaderCurvoPainter2 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //Propiedades
    lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 12;

    final path = new Path();

    //Dibujar con el path y el lapiz
    path.moveTo(size.width * 0.4, size.height);
    // path.lineTo(0, size.height * 0.96);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.84, size.width  , size.height *0.94 );
    path.lineTo(size.width, size.height );
    // path.lineTo(0, size.height);
   
    
    
    // path.lineTo(0, 0);
   

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
  }

}
