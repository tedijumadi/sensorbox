import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:compass_plus/compass_plus.dart';

class OrientationPage extends StatefulWidget {
  const OrientationPage({Key? key}) : super(key: key);

  @override
  State<OrientationPage> createState() => _OrientationPageState();
}

class _OrientationPageState extends State<OrientationPage> {
  StreamSubscription<double>? _eventsSub;
  double _directionAngle = 0;
  double northDirection = 0; // Arah utara (0 derajat)
  double rotationAngle = 0;
  double smoothValue = 0.0; // Variabel penyimpanan nilai yang disaring
  double alpha = 0.1; // Nilai alpha untuk kontrol smoothing
  bool sensorFound = true; // Flag to check if the sensor is found
  var directionText = "";

  @override
  void initState() {
    super.initState();
    _eventsSub = Compass.events.listen((event) {
      _directionAngle = event;
      // Terapkan filter rendah
      smoothValue = (1 - alpha) * smoothValue + alpha * _directionAngle;
      rotationAngle = northDirection - _directionAngle;

      // Text
      directionText = _directionAngle.toString().substring(0, 5);

      setState(() {
        sensorFound = true; // Update the flag when sensor data is available
      });
    });

    // Add error handling for sensor not found
    _eventsSub?.onError((error) {
      setState(() {
        sensorFound = false; // Update the flag when sensor is not found
      });
    });
  }

  @override
  void dispose() {
    _eventsSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0A2F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Orientation Sensor",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Image.asset(
          'assets/images/User Manual.png',
          width: 100,
        ),
        onPressed: () {
          // Check if the sensor is found before showing the bottom sheet
          if (sensorFound) {
            showModalBottomSheet(
              showDragHandle: true,
              backgroundColor: Colors.amber[100],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              context: context,
              builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Sensor orientasi, atau sering disebut sebagai sensor orientasi spasial, adalah jenis sensor yang digunakan untuk mengukur orientasi atau posisi relatif dari suatu objek dalam ruang tiga dimensi. Sensor ini mendeteksi perubahan orientasi objek terhadap sumbu-sumbu tertentu, seperti sumbu X, Y, dan Z. Informasi dari sensor orientasi digunakan untuk menentukan posisi dan arah perangkat atau objek dalam ruang.",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Display a message if the sensor is not found
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Sensor tidak ditemukan"),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
      ),
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: rotationAngle * (pi / 180), // Konversi derajat ke radian
              child: Image.asset(
                'assets/images/Fitur Compass.png',
                width: 500,
              ),
            ),
            Text(
              'Angle: $directionText\n',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
