import 'package:flutter/material.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      // body: _ListaTareas(),
      // body: _Titulo(),
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: -10,
            child: _BottonNewList()
           ),
        ],
      ),
   );
  }
}
class _BottonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 90,
      child: RaisedButton(
        color: Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
          ),
        onPressed: () {},),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola Mundo'),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            maxHeight: 200,
            minHeight: 170,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: _Titulo()),
          ),
          ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 100,)
            ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{

final double minHeight;
final double maxHeight;
final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minHeight, 
    @required this.maxHeight, 
    @required this.child
    });


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
   
    return SizedBox.expand( child: child,);
  }

  @override
  
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;

  @override
  
  double get minExtent => (minHeight < maxHeight) ? maxHeight :minHeight ;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
   
    return maxHeight != oldDelegate.maxHeight || 
           minHeight != oldDelegate.maxHeight ||
           child     !=  oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
 
 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child:Text('New',style: TextStyle(color: Color(0xff532128), fontSize: 50),) ,
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 100,),
            Positioned(
               bottom: 8,
               child: Container(
                width: 110,
                height: 8,
                color: Color(0xffF7CDD5),
              ),
            ),
           Container(child: Text('List',style: TextStyle(color: Color(0xffD93A30), fontSize: 50, fontWeight: FontWeight.bold),)),
          ],
        ),
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {

   final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:items.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _ListItem extends StatelessWidget {
  
final String titulo;
final Color color;

  const _ListItem( this.titulo, this.color);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),

      ),
      alignment: Alignment.centerLeft,
      child: Text(titulo, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),),
    );
  }
}