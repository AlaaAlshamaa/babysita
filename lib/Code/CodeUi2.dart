import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../SingUp/Utility.dart';
import 'bloc/code_bloc.dart';

class CodeUi2 extends StatefulWidget {
  // CodeUi2({Key key}) : super(key: key);

  @override
  _CodeUi2State createState() => _CodeUi2State();
}

class _CodeUi2State extends State<CodeUi2> {
  String phone = '';
  @override
  void initState() {
    super.initState();

    phone = MySharedPreferences.getphone() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController codeController = TextEditingController();

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
                },
                icon: Icon(
                  Icons.person_outline,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "testgit",
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
            Image.asset("E:\Flutter Projects\testgit\img.jpg"),
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
              phone,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[400],
              ),
            ),
            TextField(
              controller: codeController,
            ),
            ElevatedButton(
              onPressed: () {
                checkcode(codeController.text);
              },
              child: Text('تم '),
            )
          ])),
    );
  }
}

void checkcode(String code2) {
  String testcode = "123456";

  if (code2 == testcode)
    print("okkkkk coooode");
  else
    print("errroooooorrrrrrreeeeeeee coooode");
}
