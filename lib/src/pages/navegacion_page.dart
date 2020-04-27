import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NavegacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _NotificationModel(),
        child: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.pink,
          title: Text('Notifications Page'),
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
   ), 
    );
  }
}

class BottomNavigation extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

  final int numero = Provider.of<_NotificationModel>(context).numero;  
    
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text('Bones'),
          icon: FaIcon(FontAwesomeIcons.bone),
          ),
          BottomNavigationBarItem(
          title: Text('Notifications'),
          icon: Stack(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.bell),

              Positioned(
                top: 0.0,
                right: 0.0,
                // child: Icon(Icons.brightness_1, color: Colors.pink, size: 8,),
                child: BounceInDown(
                  from: 10,
                  animate: (numero > 0 ) ? true: false,
                  child: Bounce(
                    controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                    from: 20,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('$numero', style: TextStyle(color: Colors.white, fontSize: 8), ),
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ),
          BottomNavigationBarItem(
          title: Text('My dog'),
          icon: FaIcon(FontAwesomeIcons.dog),
          ),
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play), 
      onPressed: () {
        int numero = Provider.of<_NotificationModel>(context, listen: false).numero;
        numero ++;
        Provider.of<_NotificationModel>(context, listen: false).numero = numero;

        if (numero >= 2) {
          final controller = Provider.of<_NotificationModel>(context, listen: false).bounceController;
          controller.forward(from: 0.0);
        }
      },
     );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  AnimationController _bounceController;

  int get numero => this._numero;

  set numero (int valor) {
    this._numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController (AnimationController controller) {
    this._bounceController = controller;
    // notifyListeners();
  }
}