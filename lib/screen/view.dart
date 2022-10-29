
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class View extends StatelessWidget {
  String myText= "";
    Color mycolor = Color.fromARGB(255, 245, 245, 244);

  View(this.myText,this.mycolor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: mycolor,),
        backgroundColor: mycolor,
      body: Container(
        margin: EdgeInsets.only(right: 20,left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(width: 500,),
            ListTile(title: Text("type of user  :",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            trailing: Text("${myText}",style: TextStyle(fontSize: 25)),
            ),
             ListTile(title: Text("email  :",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            trailing: Text("${FirebaseAuth.instance.currentUser!.email}",style: TextStyle(fontSize: 25)),
            ),
           
          ] 

        ),
      ),
    );
  }
}