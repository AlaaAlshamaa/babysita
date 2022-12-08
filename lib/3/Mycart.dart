import 'package:flutter/material.dart';
import 'package:testgit/3/CartModel.dart';
import 'package:provider/provider.dart';

class Mycart extends StatefulWidget {
  // Mycart({Key key}) : super(key: key);

  @override
  _MycartState createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red[300],
              title: Text('Checkout Page [\$ ${cart.totalPrice}]'),
            ),
            body: cart.basketItems.length == 0
                ? Text('no items in your cart')
                : ListView.builder(
                    itemCount: cart.basketItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(cart.basketItems[index].title),
                          subtitle:
                              Text(cart.basketItems[index].price.toString()),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              cart.remove(cart.basketItems[index]);
                            },
                          ),
                        ),
                      );
                    },
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
              onPressed: () {
                setState(() {});
              },
            ));
      },
    );
  }
}
