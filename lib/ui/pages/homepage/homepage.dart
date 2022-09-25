import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//my imports
import '../../widgets/home/carousel.dart';
import '../../widgets/home/horizontal_listview.dart';
import '../../widgets/product/products.dart';
import '../cart/cart.dart';
import '../drawer/homepage_drawer.dart';

class HomePage extends StatefulWidget {
  User user;

  HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text('Fashion App'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              })
        ],
      ),
      drawer: homepageDrawer(
          email: widget.user.email,
          displayName: widget.user.displayName,
          photoURL: widget.user.photoURL),
      body: new ListView(
        children: <Widget>[
          imageCarousel,
          new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text('Categories')),

          HorizontalListView(),

          new Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 0.0,
              bottom: 0.0,
            ),
            child: new Text('Recent Products'),
          ),

          //grid view
          Container(
            height: 320.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}
