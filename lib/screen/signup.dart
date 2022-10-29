import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/screen/login.dart';

class SignUp extends StatefulWidget {
  const SignUp( {super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          
          Container(
              height: 200,
              child: Image.network(
                "https://media.discordapp.net/attachments/1035930542992015410/1036033983978405968/Sign_Up.gif?width=400&height=400",
                fit: BoxFit.fill,
              )),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
                child: Column(
              children: [
                // TextFormField(
                //   controller: ,
                //   decoration: InputDecoration(
                //       prefixIcon: Icon(Icons.person),
                //       hintText: "username",
                //       border:
                //           OutlineInputBorder(borderSide: BorderSide(width: 1))),
                // ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "email",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: false,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "password",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text("if you have Account "),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Login();
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
                        try {
                          var objectFromFirebaseAuth = FirebaseAuth.instance;

                          UserCredential myUser = await objectFromFirebaseAuth
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("saved")));
                              emailController.clear();
                              passwordController.clear();
                              
                        } catch (e) {
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Missing Value")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("the email already founded")));
                          }
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return AlertDialog(
                          //         content: Text("the email already founded"),
                          //       );
                          //     });
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ))
              ],
            )),
          )
        ],
      ),
    );
  }
}
