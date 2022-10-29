import 'package:flutter/material.dart';
import 'package:myapp/screen/view.dart';

import '../component/drawer.dart';

class Home extends StatefulWidget {
  Color mycolor = Color.fromARGB(255, 245, 245, 244);
  Home(this.mycolor);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String typeOfUser = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: widget.mycolor,
        ),
        drawer: MyDrawer(),
        backgroundColor: widget.mycolor,
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text("select user type",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20,
            ),
            RadioListTile(
                selected: true,
                selectedTileColor: Colors.black87,
                isThreeLine: true,
                secondary: Icon(
                  Icons.admin_panel_settings,
                  color: widget.mycolor,
                ),
                title: Text(
                  "Admin",
                  style: TextStyle(color: widget.mycolor),
                ),
                subtitle: Text("1", style: TextStyle(color: widget.mycolor)),
                value: "Admin",
                groupValue: typeOfUser,
                onChanged: (val) {
                  setState(() {
                    typeOfUser = val.toString();
                  });
                }),
            RadioListTile(
                selected: true,
                selectedTileColor: Colors.black87,
                isThreeLine: true,
                secondary: Icon(
                  Icons.person,
                  color: widget.mycolor,
                ),
                title: Text("Normal", style: TextStyle(color: widget.mycolor)),
                subtitle: Text("2", style: TextStyle(color: widget.mycolor)),
                value: "Normal",
                groupValue: typeOfUser,
                onChanged: (val) {
                  setState(() {
                    typeOfUser = val.toString();
                  });
                }),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (typeOfUser.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("select from choices")));
                  } else {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return View(typeOfUser.toString(), widget.mycolor);
                    }));
                  }
                },
                child: Text("next"))
          ],
        ));
  }
}
