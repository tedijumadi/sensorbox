import 'package:flutter/material.dart';
import 'dart:async';
import 'package:environment_sensors/environment_sensors.dart';

class PressurePage extends StatefulWidget {
  const PressurePage({Key? key}) : super(key: key);

  @override
  State<PressurePage> createState() => _PressurePageState();
}

class _PressurePageState extends State<PressurePage> {
  bool _pressureAvailable = false;
  final environmentSensors = EnvironmentSensors();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool pressureAvailable =
        await environmentSensors.getSensorAvailable(SensorType.Pressure);

    setState(() {
      _pressureAvailable = pressureAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0A2F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Pressure Sensor",
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
                    "Pressure sensor, atau sensor tekanan, adalah perangkat atau komponen yang digunakan untuk mengukur tekanan dalam suatu medium. Sensor ini merespons perubahan tekanan dan mengonversinya menjadi sinyal listrik yang dapat diukur. Informasi yang diperoleh dari sensor tekanan dapat digunakan dalam berbagai aplikasi, seperti pengukuran tekanan atmosfer, kendali otomatis, dan pengukuran tekanan dalam sistem industri.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      body: Center(
        child: (_pressureAvailable)
            ? StreamBuilder<double>(
                stream: environmentSensors.pressure,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  return Text(
                    'The Current Pressure is: ${snapshot.data?.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  );
                },
              )
            : Text(
                'No pressure sensor found',
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
