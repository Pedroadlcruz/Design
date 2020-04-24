import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButtom {
 final Function onPressed;
 final IconData icon;

  PinterestButtom({
    @required this.onPressed, 
    @required this.icon});

}

class PinterestMenu extends StatelessWidget {

  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButtom> items;
  PinterestMenu({ 
    this.mostrar = true, 
    this.backgroundColor = Colors.white, 
    this.activeColor     = Colors.black, 
    this.inactiveColor   = Colors.blueGrey, 
    @required this.items,
    });

// final List<PinterestButtom> items = [
//   PinterestButtom(icon: Icons.pie_chart, onPressed: (){print('Icon pie_Chart');}),
//   PinterestButtom(icon: Icons.search, onPressed: (){print('Icon search');}),
//   PinterestButtom(icon: Icons.notifications, onPressed: (){print('Icon Notifications');}),
//   PinterestButtom(icon: Icons.supervised_user_circle, onPressed: (){print('Icon supervised_user_circle');}),
// ];



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (mostrar) ? 1: 0,
         child: Builder(
           builder: (BuildContext context){

          Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
          Provider.of<_MenuModel>(context).activeColor = this.activeColor;
          Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;

             return _PinterestMenuBackground(
              child: _MenuItems( items),
            );
            }
         ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  
  final Widget child;
 
  
   _PinterestMenuBackground({
     @required this.child,
     });

  @override
  Widget build(BuildContext context) {

Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: this.child,
     width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black38,
            // offset: Offset(10, 10),
            blurRadius: 10,
            spreadRadius: -5,
          )
        ],
      ),
      // child: Text('HolaMundo desde el menu'),
    );
  }
}

class _MenuItems extends StatelessWidget {

final List<PinterestButtom> menuItems ;

  const _MenuItems( this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButtom(i, menuItems[i])),
    );
  }
}

class _PinterestMenuButtom extends StatelessWidget {
  
  final int index ;
  final PinterestButtom item;

 _PinterestMenuButtom(this.index, this.item);

  @override
  Widget build(BuildContext context) {

   final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

   final menuModel =Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: (itemSeleccionado == index) ? Colors.greenAccent :Colors.pinkAccent.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 :25,
          color: (itemSeleccionado == index) ? menuModel.activeColor :menuModel.inactiveColor,
           
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {

 int _itemSeleccionado = 0;
 Color backgroundColor = Colors.white ;  
 Color activeColor = Colors.black;
 Color inactiveColor = Colors.blueGrey;


  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado (int index){
    this._itemSeleccionado = index;
    notifyListeners();
  }

  // Color get backgroundColor => this._backgroundColor;
  
}