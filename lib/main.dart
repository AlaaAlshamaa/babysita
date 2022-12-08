import 'package:testgit/3/HomePage.dart';
import 'package:testgit/SingUp/bloc/singup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '3/CartModel.dart';
import 'SingUp/SingUpUI.dart';
import 'SingUp/Utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MySharedPreferences.init();
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomePage(),
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (_) => SingupBloc(),
          child: SingUpUI(),
        ));
  }
}
