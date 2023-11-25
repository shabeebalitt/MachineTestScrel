import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mechine_test_screl/widget/toast_message.dart';
import 'package:provider/provider.dart';

import 'Repository/Modal_Class/user.dart';
import 'Repository/provider/add_user_provider.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();

final now =  DateTime.now();
String formatter = DateFormat('dd/MM/yyyy').format(now);

class _AddUserState extends State<AddUser> {
  @override
  void dispose() {
    email.clear();
    name.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 360.w,
                height: 700.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.black, width: 1.5.w)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
                    SizedBox(
                      width: 320.w,
                      child: TextFormField(
                        controller: name,
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(color: Colors.black)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 320.w,
                      child: TextFormField(
                        controller: email,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(color: Colors.black)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    SizedBox(
                      height: 300.h,
                    ),
                    GestureDetector(
                      onTap: () {

                     if(email.text.isNotEmpty && name.text.isNotEmpty){

                        final signupDetailsProvider = Provider.of<UserDetailsProvider>(context, listen: false);
                        signupDetailsProvider.addSignupDetails(
                          UserDetails(
                            username: name.text,
                            email: email.text,
                            created: formatter.toString(),
                          ),
                        );
                        Navigator.of(context).pop();
                     }else{
                       return ToastMessage().toastmessage(message: "Field Should Not Be Empty!");
                     }
                      },
                      child: Container(
                        width: 200.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            "Create",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
