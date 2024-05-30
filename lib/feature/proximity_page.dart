import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'dart:async';
import 'package:proximity_sensor/proximity_sensor.dart';

class ProximityPage extends StatefulWidget {
  const ProximityPage({super.key});

  @override
  _ProximityPageState createState() => _ProximityPageState();
}

class _ProximityPageState extends State<ProximityPage> {
  bool _isNear = false;
  late StreamSubscription<dynamic> _streamSubscription;

  @override
  void initState() {
    super.initState();
    listenSensor();
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  Future<void> listenSensor() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (foundation.kDebugMode) {
        FlutterError.dumpErrorToConsole(details);
      }
    };
    _streamSubscription = ProximitySensor.events.listen((int event) {
      setState(() {
        _isNear = (event > 0) ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0A2F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Proximity Sensor",
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
                    "Proximity sensor, atau sensor kedekatan, adalah perangkat elektronik yang digunakan untuk mendeteksi sejauh apa suatu objek berada dari sensor tersebut. Sensor ini bekerja dengan cara mengukur perubahan dalam medan atau pantulan cahaya, suara, atau gelombang elektromagnetik lainnya. Tujuan utama dari proximity sensor adalah untuk mendeteksi keberadaan objek atau permukaan dalam jarak yang relatif dekat dengan sensor, dan seringkali digunakan untuk mengaktifkan atau menonaktifkan suatu fungsi atau perangkat. ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      body: Center(
        child: Text(
          'Proximity sensor, is near? $_isNear',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
