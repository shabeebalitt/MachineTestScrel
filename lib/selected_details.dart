import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Repository/provider/add_user_provider.dart';

class SelectedDetails extends StatefulWidget {
  final int index;
  final String name;
  final String email;
  final String created;

  const SelectedDetails({
    Key? key,
    required this.index,
    required this.name,
    required this.email,
    required this.created,

  }) : super(key: key);

  @override
  State<SelectedDetails> createState() => _SelectedDetailsState();
}

class _SelectedDetailsState extends State<SelectedDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Center(
          child: Container(
            width: 360.w,
            height: 700.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.black,width: 1.5.w)
            ),
            child: Column(
              children: [
                SizedBox(height: 80.h,),
                Text("Name : ${widget.name.toString()}",
                style: TextStyle(
                  fontSize: 22.sp
                ),),
                SizedBox(height: 10.h,),
                Text("Email : ${widget.email.toString()}",
                  style: TextStyle(
                      fontSize: 21.sp
                  ),),
                SizedBox(height: 10.h,),
                Text("Create At : ${widget.created.toString()}",
                  style: TextStyle(
                      fontSize: 20.sp
                  ),),
                SizedBox(height: 50.h,),
                GestureDetector(
                  onTap: () {
                    showDialog(
                    context: context, builder: (BuildContext context) { return
                      AlertDialog(
                      title: Text("Are You Sure?"),
                        actions: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("NO")),
                          SizedBox(width: 10.w,),
                          GestureDetector(
                              onTap: () {
                                final signupDetailsProvider = Provider.of<UserDetailsProvider>(context, listen: false);

                                // Replace 'usernameToRemove' with the actual username you want to remove
                                signupDetailsProvider.removeSignupDetails(widget.name.toString());
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: Text("Yes"))
                        ],
                    );  },
                    );
                  },
                  child: Container(
                    width: 150.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text("Delete",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
