import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Code/CodeUi.dart';
import '../Code/CodeUi2.dart';
import 'Utility.dart';
import 'bloc/singup_bloc.dart';

class SingUpUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController unameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController pw1Controller = TextEditingController();
    TextEditingController pw2Controller = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                SizedBox(
                  width: 400,
                  child: Container(
                    child: Column(
                      children: [
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.person_outline,
                              color: Colors.grey[600],
                            ),
                            title: Text('اسم المستخدم'),
                            subtitle: TextField(
                              controller: unameController,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-zA-Z0-9]')),
                              ],
                              decoration: InputDecoration(hintText: "Alaa"),
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.password_outlined,
                              color: Colors.grey[600],
                            ),
                            title: Text('رقم الموبايل'),
                            subtitle: TextField(
                              controller: phoneController,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]')),
                              ],
                              decoration: InputDecoration(
                                hintText: "098767677",
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.password_outlined,
                              color: Colors.grey[600],
                            ),
                            title: Text('كلمة المرور'),
                            subtitle: TextField(
                              controller: pw1Controller,
                              decoration: InputDecoration(),
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.password_outlined,
                              color: Colors.grey[600],
                            ),
                            title: Text('تأكيد كلمة المرور'),
                            subtitle: TextField(
                              controller: pw2Controller,
                              decoration: InputDecoration(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FloatingActionButton.extended(
                  extendedIconLabelSpacing: 200,
                  backgroundColor: Colors.red[300],

                  label: Text('متابعة'), // <-- Text
                  icon: Icon(
                    // <-- Icon
                    Icons.next_plan,
                    size: 24.0,
                  ),
                  onPressed: () {
                    context.read<SingupBloc>().add(Printdata(
                        uname: unameController.text,
                        phone: phoneController.text,
                        pw1: pw1Controller.text,
                        pw2: pw2Controller.text));

                    context.read<SingupBloc>().add(AddData(
                        uname: unameController.text,
                        phone: phoneController.text,
                        pw1: pw1Controller.text,
                        pw2: pw2Controller.text));

                    MySharedPreferences.setphone(
                      phoneController.text,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CodeUi2()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
