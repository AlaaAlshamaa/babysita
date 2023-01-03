import 'package:flutter/material.dart';
import 'package:testgit/3/CartModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CartModel.dart';
import 'HomePage.dart';
import 'bloc/cart_bloc.dart';

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
        return Provider<CartBloc>(
            create: (_) => CartBloc(),
            builder: (context, child) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.red[300],
                  title: Text('سلة المشتريات'),
                ),
                body: cart.basketItems.length == 0
                    ? Text('ليس لديك أي مشتريات بعد..')
                    : ListView.builder(
                        itemCount: cart.basketItems.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(cart.basketItems[index].title),
                              subtitle: Text(
                                  cart.basketItems[index].price.toString()),
                              leading: Text(
                                  cart.basketItems[index].quantity.toString()),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      cart.addone(cart.basketItems[index]);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.minimize),
                                    onPressed: () {
                                      cart.minimize(cart.basketItems[index]);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      cart.remove(cart.basketItems[index]);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                floatingActionButton: Center(
                  child: BlocListener<CartBloc, CartState>(
                    listener: (context, state) {
                      if (state is Ok) {
                        const snackBar = SnackBar(
                          content: Text('تم تأكيد الطلب'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else if (state is Error) {
                        const snackBar = SnackBar(
                          content: Text('حدثث خطأ'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: FloatingActionButton.extended(
                      extendedIconLabelSpacing: 30,
                      backgroundColor: Colors.red[300],
                      label: Text('[ ${cart.totalPrice}]',
                          style: TextStyle(
                            fontSize: 24,
                          )), // <-- Text
                      icon: Icon(
                        // <-- Icon
                        Icons.shopping_bag_outlined,
                        size: 28.0,
                      ),
                      onPressed: () {
                        print("serv");
                        context.read<CartBloc>().add(AddCart(order: cart));
                      },
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
