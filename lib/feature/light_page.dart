import 'package:flutter/material.dart';
import 'package:light_sensor/light_sensor.dart';

class LightsensorPage extends StatefulWidget {
  const LightsensorPage({Key? key}) : super(key: key);

  @override
  State<LightsensorPage> createState() => _LightsensorPageState();
}

class _LightsensorPageState extends State<LightsensorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0A2F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Light Sensor",
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
                    "Light sensor, atau sensor cahaya, adalah perangkat atau komponen elektronik yang dirancang untuk mendeteksi tingkat intensitas cahaya di sekitarnya. Sensor ini dapat beroperasi dengan berbagai prinsip, namun tujuannya adalah untuk mengukur cahaya dan mengubahnya menjadi sinyal listrik yang dapat diukur. Informasi yang diperoleh dari sensor cahaya dapat digunakan untuk berbagai aplikasi, seperti mengatur kecerahan layar pada perangkat elektronik, mengontrol lampu otomatis, atau bahkan mengukur intensitas cahaya di lingkungan tertentu.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      body: Center(
        child: FutureBuilder<bool>(
          future: LightSensor.hasSensor(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final bool hasSensor = snapshot.data!;
              if (hasSensor) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Idea.png',
                      width: 200,
                    ), // replace 'your_image.png' with your actual image asset path
                    SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<int>(
                      stream: LightSensor.luxStream(),
                      builder: (context, luxSnapshot) {
                        if (luxSnapshot.hasData) {
                          return Text(
                            'Running on: ${luxSnapshot.data} LUX',
                            style: TextStyle(color: Colors.white),
                          );
                        } else {
                          return const Text(
                            'Running on: unknown',
                            style: TextStyle(color: Colors.white),
                          );
                        }
                      },
                    ),
                  ],
                );
              } else {
                return const Text("Your device doesn't have a light sensor");
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
