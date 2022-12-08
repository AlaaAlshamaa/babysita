import 'package:testgit/SingUp/Utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/code_bloc.dart';

class CodeUi extends StatefulWidget {
  CodeUi(String phone);
  // Future<String> phone1 =  MySharedPreferences.instance.getStringValue("email");
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CodeBloc(),
      child: Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            IconButton(
                onPressed: () {
                  context.read<CodeBloc>().add(Getphone());
                  // setState(() {});
                },
                icon: Icon(
                  Icons.person_outline,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Testgit",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.red[300],
                  ),
                ),
                Text(
                  "حساب جديد",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            //Image(image: image) AssetImage("E:\Flutter Projects\testgit\img.jpg"),
            Text(
              "التحقق من رقم الهاتف",
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey[600],
              ),
            ),
            Text(
              "تم إرسال كود مكون من 6 محارف إلى الرقم",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[400],
              ),
            ),
            Text(
              ";;;;;;",
              //  phone1,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[400],
              ),
            ),
          ])),
    );
  }
}
