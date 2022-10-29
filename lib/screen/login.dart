import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screen/home.dart';
import 'package:myapp/screen/signup.dart';

import '../component/alert.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  GlobalKey<FormState> mykey = GlobalKey();
  Color mycolor = Color.fromARGB(255, 243, 243, 239);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
              height: 200,
              child: Image.network(
                "https://media.discordapp.net/attachments/1035930542992015410/1036033984494313472/register.gif?width=400&height=314",
                fit: BoxFit.fill,
              )),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
                key: mykey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (data) {
                        if (data == "blue@ltuc.com") {
                          mycolor = Color.fromARGB(255, 23, 7, 255);
                        }
                        if (data == "red@ltuc.com") {
                          mycolor = Color.fromARGB(255, 255, 8, 8);
                        }
                        if (data == "green@ltuc.com") {
                          mycolor = Color.fromARGB(255, 0, 255, 34);
                        }
                        if (data == "mix@ltuc.com") {
                          mycolor = Color.fromARGB(255, 148, 137, 196);
                        }
                      },
                      controller: controllerEmail,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2))),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: controllerPassword,
                      obscureText: false,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "password",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2))),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text("if you havan't accout "),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return SignUp();
                                }));
                              },
                              child: Text(
                                "Click Here",
                                style: TextStyle(color: Colors.blue.shade900),
                              ),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            Colors.black45,
                          )),
                          onPressed: () async {
                            if (mykey.currentState!.validate()) {
                              try {
                                var objectFromFirebaseAuth =
                                    FirebaseAuth.instance;
                                if (controllerEmail.text.isNotEmpty &&
                                    controllerPassword.text.isNotEmpty) {
                                  showLoading(context);
                                }

                                UserCredential myUser =
                                    await objectFromFirebaseAuth
                                        .signInWithEmailAndPassword(
                                            email: controllerEmail.text,
                                            password: controllerPassword.text);
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Home(mycolor);
                                }));
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "chek your password or email")));
                              }
                            }
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        )),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
