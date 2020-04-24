import 'package:disenos/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';


class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (_) => new _MenuModel(),
        child: Scaffold(
        body: Stack(
          children: <Widget>[
             PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
        // body: PinterestMenu(),
        // body: PinterestGrid(),
   ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final widhtPantalla = MediaQuery.of(context).size.width;

    final mostrar = Provider.of<_MenuModel>(context).mostrar;

    return Positioned(
      bottom: 15,
      child: Container(
        width: widhtPantalla,
        child: Align(
          child: PinterestMenu(
            mostrar: mostrar,
            // backgroundColor: Colors.red.withOpacity(0.5),
            // activeColor: Colors.yellow,
            // inactiveColor: Colors.white,
            items: [
                 PinterestButtom(icon: Icons.pie_chart, onPressed: (){print('Icon pie_Chart');}),
                 PinterestButtom(icon: Icons.search, onPressed: (){print('Icon search');}),
                 PinterestButtom(icon: Icons.notifications, onPressed: (){print('Icon Notifications');}),
                 PinterestButtom(icon: Icons.supervised_user_circle, onPressed: (){print('Icon supervised_user_circle');}),
            ],
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
final List <int>items = List.generate(200, (i)=> i);

ScrollController controller =  new ScrollController();
double scrollAnterior = 0;
@override
  void initState() {

    controller.addListener((){
      if(controller.offset  > scrollAnterior && controller.offset > 150){
       Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      }else {
       Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
      // print('ScrollListener  ${controller.offset}' );
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
    return new StaggeredGridView.countBuilder(
  controller: controller,
  crossAxisCount: 4,
  itemCount: items.length,
  itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
  staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(2, index.isEven ? 2 : 3),
  mainAxisSpacing: 4.0,
  crossAxisSpacing: 4.0,
);
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

   _PinterestItem(this.index);



  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
        color: Colors.blue,  
        borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel  with ChangeNotifier{

  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar (bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }
  
}