import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  double? averageSpeed;
  bool flag = false;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("permission not given");
      LocationPermission asked = await Geolocator.requestPermission();
    } else {
      Position CurrentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print(CurrentPosition.longitude);
      print(CurrentPosition.altitude);
      await Future.delayed(Duration(seconds: 30));
      Position NewPosition = await Geolocator.getCurrentPosition();
      double distance = await Geolocator.distanceBetween(
          CurrentPosition.latitude,
          CurrentPosition.longitude,
          NewPosition.latitude,
          NewPosition.longitude);
      double speed = distance / 30;
      setState(() {
        widget.averageSpeed = speed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 10,
            centerTitle: true,
            leading: const Icon(Icons.speed),
            shadowColor: Colors.amber,
            backgroundColor: Colors.amber,
            title: const Text("Average Speed"),
          ),
          body: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const FlutterLogo(
                    size: 250,
                  ),
                  widget.flag == false
                      ? const Text("")
                      : widget.averageSpeed == null
                      ? const Text(
                    " waiting...",
                    style: TextStyle(fontSize: 25),
                  )
                      : Text(
                    widget.averageSpeed!
                        .toStringAsFixed(3)
                        .toString() +
                        " Km/H",
                    style: TextStyle(fontSize: 25),
                  ),
                  Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.amber,
                        backgroundColor: Color.fromARGB(255, 65, 142, 180),
                        animationDuration: Duration(seconds: 4),
                        textStyle: const TextStyle(fontSize: 12),
                      ),
                      onPressed: () {
                        widget.flag = true;
                        getCurrentPosition();
                      },
                      child: const Text("calculate the average Speed"),
                    ),
                  ),
                ],
              )),
        ));
  }
}
