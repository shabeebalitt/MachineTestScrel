import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechine_test_screl/selected_details.dart';
import 'package:provider/provider.dart';

import 'Repository/provider/add_user_provider.dart';
import 'add_user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    final signupDetailsProvider = Provider.of<UserDetailsProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddUser()));
          }, icon: Icon(Icons.add,color: Colors.black,)),
          SizedBox(width: 10.w,)],
        ),

        body:
        signupDetailsProvider.usersDetailsList.isNotEmpty?
        ListView.separated(
            padding: EdgeInsets.only(top: 20.h,bottom: 20.h,left: 20.w,right: 20.w),
            itemBuilder: (context, index) {
              final details = signupDetailsProvider.usersDetailsList[index];
          return GestureDetector(
            onTap:() {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SelectedDetails(
                index: index,
                name: details.username.toString(),
                email: details.email.toString(),
                created: details.created.toString(),)));
            },
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1.5.w),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name : ${details.username.toString()}"),
                    SizedBox(height:8.h),
                    Text("Email : ${details.email.toString()}")
                  ],
                ),
              ),
            ),
          );
        }, separatorBuilder: (context, index) {
          return SizedBox(height: 10.h,);
        }, itemCount: signupDetailsProvider.usersDetailsList.length):TextButton(
            onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddUser()));
        }, child: Center(child: Text("Add New User",style: TextStyle(
          color: Colors.blue
        ),))),
      ),
    );
  }
}
