import 'package:flutter/material.dart';
import 'package:sensorbox/feature/accelometer_page.dart';
import 'package:sensorbox/feature/gyroscope_page.dart';
import 'package:sensorbox/feature/light_page.dart';
import 'package:sensorbox/feature/magnet_page.dart';
import 'package:sensorbox/feature/orientation_page.dart';
import 'package:sensorbox/feature/pressure_page.dart';
import 'package:sensorbox/feature/proximity_page.dart';
import 'package:sensorbox/feature/sound_page.dart';
import 'package:sensorbox/feature/temperature_page.dart';

class SensorBox extends StatelessWidget {
  const SensorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0A2F),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccelometerPage(),
                    )),
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust the padding as needed
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/images/Basketball.png',
                              width: 90, height: 90),
                          Visibility(
                            visible: false,
                            child: Image.asset('assets/images/Lock.png',
                                width: 70, height: 70),
                          ),
                        ],
                      ),
                      Text(
                        'Accelometer Sensor',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LightsensorPage(),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Sesuaikan padding sesuai kebutuhan
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/Desk Lamp.png',
                            width: 90,
                            height: 90,
                          ),
                          Visibility(
                            visible: false,
                            child: Image.asset(
                              'assets/images/Lock.png',
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Light Sensor',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrientationPage(),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Sesuaikan padding sesuai kebutuhan
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/Compass.png',
                            width: 90,
                            height: 90,
                          ),
                          Visibility(
                            visible: false,
                            child: Image.asset(
                              'assets/images/Lock.png',
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Orientation Sensor',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 90,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProximityPage(),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust the padding as needed
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/images/Sunflower.png',
                              width: 90, height: 90),
                          Visibility(
                            visible: false,
                            child: Image.asset('assets/images/Lock.png',
                                width: 70, height: 70),
                          ),
                        ],
                      ),
                      Text(
                        'Proximity Sensor',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TemperaturePage(),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust the padding as needed
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/images/Temperature.png',
                              width: 90, height: 90),
                          Visibility(
                            visible: true,
                            child: Image.asset('assets/images/Lock.png',
                                width: 70, height: 70),
                          ),
                        ],
                      ),
                      Text(
                        'Temperature Sensor',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GyroscopePage(),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Sesuaikan padding sesuai kebutuhan
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/Satellites.png',
                            width: 90,
                            height: 90,
                          ),
                          Visibility(
                            visible: false,
                            child: Image.asset(
                              'assets/images/Lock.png',
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Gyroscope Sensor',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 90,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SoundPage(),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust the padding as needed
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/images/Microphone.png',
                              width: 90, height: 90),
                          Visibility(
                            visible: false,
                            child: Image.asset('assets/images/Lock.png',
                                width: 70, height: 70),
                          ),
                        ],
                      ),
                      Text(
                        'Sound Sensor',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MagnetPage(),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Sesuaikan padding sesuai kebutuhan
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/Magnet.png',
                            width: 90,
                            height: 90,
                          ),
                          Visibility(
                            visible: false,
                            child: Image.asset(
                              'assets/images/Lock.png',
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Magnet Sensor',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PressurePage(),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust the padding as needed
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/images/Pressure.png',
                              width: 90, height: 90),
                          Visibility(
                            visible: true,
                            child: Image.asset('assets/images/Lock.png',
                                width: 70, height: 70),
                          ),
                        ],
                      ),
                      Text(
                        'Pressure Sensor',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // Similar rows for other animals
        ],
      ),
    );
  }
}
