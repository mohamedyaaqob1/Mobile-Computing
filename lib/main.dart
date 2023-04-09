import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      "assets/yacoub.jpg",
                      
                    ),
                  ),
                ),
                Text(
                  "Mohamed Sayed Mohamed Yacoub",
                  style: TextStyle(fontFamily: "Pacifico", fontSize: 20),
                ),
                Container(
                  width: 250,
                  child: TextFormField(
                    readOnly: true,
                    decoration:
                        InputDecoration(hintText: "ms4001@fayoum.edu.eg"),
                  ),
                ),
                Container(
                  width: 250,
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(hintText: "01016850329"),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
