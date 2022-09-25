import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart/cart.dart';
import '../create_account/view_model/create_account_view_model.dart';
import '../login/login.dart';

Drawer homepageDrawer ({String? displayName,String? email,String? photoURL})=> Drawer(
  child: new ListView(
    children: <Widget>[
      new UserAccountsDrawerHeader(
        accountName: Text(displayName ?? ''),
        accountEmail: Text(email ?? ''),
        currentAccountPicture: GestureDetector(
          child: new CircleAvatar(
            backgroundColor: Colors.grey,
            child: Image(image:NetworkImage(photoURL ?? '')),
          ),
        ),
      ),
      InkWell(
        onTap: () => Get.back(),
        child: ListTile(
          title: Text('Home Page'),
          leading: Icon(
            Icons.home,
            color: Colors.red,
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('My Account'),
          leading: Icon(
            Icons.person,
            color: Colors.red,
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('My Orders'),
          leading: Icon(
            Icons.shopping_basket,
            color: Colors.red,
          ),
        ),
      ),
      InkWell(
        onTap: () =>
          Get.to(() => Cart()),
        child: ListTile(
          title: Text('Shopping Cart'),
          leading: Icon(
            Icons.shopping_cart,
            color: Colors.red,
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('Favourites'),
          leading: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
      ),
      Divider(),
      InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('Settings'),
          leading: Icon(
            Icons.settings,
            color: Colors.red,
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('About'),
          leading: Icon(
            Icons.help,
            color: Colors.red,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top:10.0),
        child: InkWell(
          onTap: () {
            Auth googleAuth = Auth();
            googleAuth.handleSignOut();
            Get.off( ()=>Login());
          },
          child: ListTile(
            title: Text('Log Out'),
            leading: Icon(
              Icons.help,
              color: Colors.red,
            ),
          ),
        ),
      ),
    ],
  ),
);