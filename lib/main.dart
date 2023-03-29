import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
          title: const Text(
            'Birthday Card',
          ),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage(r'C:\Users\ms400\StudioProjects\app\image/pd.jpg')
            ),
            Text(
              'Happy Birthday !!'
            ),
          ],
        ),
      )
    );
  }
}

