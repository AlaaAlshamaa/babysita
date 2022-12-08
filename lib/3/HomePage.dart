import 'package:testgit/3/Mycart.dart';
import 'package:testgit/SingUp/SingUpUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'CartModel.dart';
import 'ItemModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Item> items = [
    Item(
      title: 'T-SHIRT ',
      price: 500.0,
    ),
    Item(title: 'SHOES ', price: 400.0),
    Item(title: 'PRASHOT', price: 40.0),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      //FetchApi fetchapi=FetchApi() //
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[300],
          title: Text('Shopping cart'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print("oooo");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mycart()),
                      );
                    },
                  ),
                  Text(cart.count.toString())
                ],
              ),
            )
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      children: [
                        SizedBox.square(
                          dimension: 40,
                          // child: Image.asset(
                          // "images/OIP.jpg",
                          //fit: BoxFit.cover,
                          // ),
                        ),
                        Text(items[index].title),
                      ],
                    ),
                    subtitle: Text(items[index].price.toString()),
                    trailing: Icon(Icons.add),
                    onTap: () {
                      cart.add(items[index]);
                    },
                  );
                },
              ),
              FloatingActionButton.extended(
                extendedIconLabelSpacing: 200,
                backgroundColor: Colors.red[300],
                label: Text('سلة المشتريات'), // <-- Text
                icon: Icon(
                  // <-- Icon
                  Icons.next_plan,
                  size: 24.0,
                ),
                onPressed: () {
                  print("bbb");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mycart()),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
