import 'package:disenos/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          
          HeaderCurvo(),
          // HeaderWave2(),
          
          Positioned(
                 left: 360,
                 top: 80,
             child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
          HeaderWave1(),
          // Positioned(
          //        left: 115,
          //        top: -5,
          //    child: Container(
          //     width: 120,
          //     height: 120,
          //     decoration: BoxDecoration(
          //       color: Colors.deepOrangeAccent,
          //       shape: BoxShape.circle,
          //     ),
          //   ),
          // ),
           HeaderCurvo2(),
           HeaderCurvo1(),
           
          
        ],
      ),
    );
  }
}

