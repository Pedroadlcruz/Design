
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {

final IconData icon;
final String texto;
final Color color1;
final Color color2;
final Function onPress;

  const BotonGordo({
              this.icon = FontAwesomeIcons.carrot, 
    @required this.texto, 
              this.color1 = Colors.grey, 
              this.color2 = Colors.blueGrey, 
    @required this.onPress
    });




  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
          onTap: this.onPress,
          child: Stack(children: <Widget>[
         _BotonGordoBackground(color1: this.color1, color2: this.color2, icon: this.icon,),

         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             SizedBox(height: 140, width: 40,),
             FaIcon(this.icon, size:  40, color: Colors.white,),
             SizedBox(width: 20,),
             Expanded(child: Text(this.texto, style: TextStyle(color: Colors.white, fontSize: 18),)),
             FaIcon(FontAwesomeIcons.chevronRight, size:  20, color: Colors.white,),
             SizedBox(width: 40,),
           ],
         )
      ],
   ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  
 final Color color1;
 final Color color2;
 final IconData icon;

  const _BotonGordoBackground( {
    this.color1, 
    this.color2, 
    this.icon = FontAwesomeIcons.carrot,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius:  BorderRadius.circular(15),
              child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(this.icon, size:  150, color: Colors.white.withOpacity(0.2),),
            ),
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow> [
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(4, 6), blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: <Color>[
          this.color1,
          this.color2,
          
        ]
       ),
      ),
    );
  }
}