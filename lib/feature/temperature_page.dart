import 'package:flutter/material.dart';
import 'dart:async';
import 'package:environment_sensors/environment_sensors.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  bool _tempAvailable = false;
  final environmentSensors = EnvironmentSensors();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool tempAvailable = await environmentSensors
        .getSensorAvailable(SensorType.AmbientTemperature);

    setState(() {
      _tempAvailable = tempAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0A2F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Temperature Sensor",
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
                    "Temperature sensor, atau sensor suhu, adalah perangkat atau komponen yang digunakan untuk mengukur suhu suatu objek atau lingkungan. Sensor suhu menghasilkan sinyal listrik yang berubah sesuai dengan perubahan suhu, dan informasi ini dapat digunakan untuk memantau atau mengontrol suhu dalam berbagai aplikasi.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      body: Center(
        child: (_tempAvailable)
            ? StreamBuilder<double>(
                stream: environmentSensors.temperature,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  return Text(
                    'The Current Temperature is: ${snapshot.data?.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  );
                },
              )
            : Text(
                'No temperature sensor found',
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
