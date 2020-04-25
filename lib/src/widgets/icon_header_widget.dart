import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';

class IconHeader extends StatelessWidget {

final IconData icon;
final String titulo;
final String subtitulo;
final Color color1;
final Color color2;

  const IconHeader({
    @required this.icon, 
    @required this.titulo, 
    @required this.subtitulo, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey,
    });

  @override
  Widget build(BuildContext context) {

final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
      children: <Widget>[
        _IconHeaderBackground(
          color1: this.color1,
          color2: this.color2,
          ),

        Positioned(
          top: -50,
          left: -74,
          child: FaIcon(this.icon, size: 250,color: Colors.white.withOpacity(0.3),),
        ),

        Column(
          children: <Widget>[
            SizedBox(height: 89, width: double.infinity,),
            Text(this.titulo, style: TextStyle(fontSize: 18, color: colorBlanco),),
            SizedBox(height: 16,),
            Text(this.subtitulo, style: TextStyle(fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            FaIcon(this.icon, size: 80,color: Colors.white,),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
final Color color1;
final Color color2;

  const _IconHeaderBackground({
   @required this.color1,
   @required this.color2
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
       gradient: LinearGradient(
         begin: Alignment.topCenter,
         end: Alignment.bottomCenter,
         colors: <Color>[
           this.color1,
           this.color2,
        //  Color(0xff526BF6),
        //  Color(0xff67ACF2),
       ]),
      ),
    );
  }
}