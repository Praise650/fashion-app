import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {

  var productsOnTheCart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "price": 50,
      "size": "7",
      "color": "Red",
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productsOnTheCart.length,
        itemBuilder: (context, index){
          return SingleCartProduct(
              cartProdName:productsOnTheCart[index]["name"],
              cartProdPicture:productsOnTheCart[index]["picture"],
              cart_prod_price:productsOnTheCart[index]["price"],
              cart_prod_size:productsOnTheCart[index]["size"],
              cart_prod_color:productsOnTheCart[index]["color"],
              cart_prod_qty:productsOnTheCart[index]["quantity"],

          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProdName;
  final cartProdPicture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  SingleCartProduct({
    this.cartProdName,
    this.cartProdPicture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_qty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child:ListTile(
          // =========Leading Section===========
        leading: Image.asset(cartProdPicture,
          width: 100.0,
          height: 100.0,),

        // =========Title Section===========
        title: Text(cartProdName),
        subtitle: Column(
          children: [
          Row(
              children: <Widget>[
                Padding(
                  padding:  EdgeInsets.all(0.0),
                  child: Text("Size:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,),),
                ),
                Padding(
                  padding:  EdgeInsets.all(4.0),
                  child: Text(cart_prod_size),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text('Color:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,),),
                ),
                Padding(
                  padding:  EdgeInsets.all(4.0),
                  child: Text(cart_prod_color),
                ),
              ],
          ),

            // =========Product Price Section===========
            Container(
              alignment: Alignment.topLeft,
              child: Text("\$${cart_prod_price}",
                style: TextStyle(
                  fontSize: 16.0,
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
