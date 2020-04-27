// import 'package:disenos/src/pages/animaciones_page.dart';
// import 'package:disenos/src/pages/headers_page.dart';
// import 'package:disenos/src/retos/cuadrado_animado_page.dart';
// import 'package:disenos/src/pages/pinterest_page.dart';
// import 'package:disenos/src/pages/navegacion_page.dart';
import 'package:disenos/src/pages/pagina1_page.dart';
// import 'package:disenos/src/pages/twiter_page.dart';
// import 'package:disenos/src/pages/sliver_list_page.dart';
// import 'package:disenos/src/pages/graficas_circulares_page.dart';
// import 'package:disenos/src/pages/emergency_page.dart';

import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      // home: TwiterPage(),
      home: Pagina1Page(),
    );
  }
}