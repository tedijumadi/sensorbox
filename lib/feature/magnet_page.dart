import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MagnetPage extends StatefulWidget {
  const MagnetPage({super.key});

  @override
  State<MagnetPage> createState() => _MagnetPageState();
}

class _MagnetPageState extends State<MagnetPage> {
  final magnetometerListener = magnetometerEvents;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0A2F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Magnet Sensor",
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
                    "Magnet sensor, atau sensor magnetik, adalah perangkat atau komponen yang dirancang untuk mendeteksi medan magnet dalam lingkungan sekitarnya. Sensor ini merespons perubahan dalam medan magnet dan mengonversinya menjadi sinyal listrik yang dapat diukur. Informasi yang diperoleh dari sensor magnet dapat digunakan untuk berbagai aplikasi, termasuk navigasi, deteksi posisi, dan pengukuran medan magnetik.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      body: Container(
        width: double.maxFinite,
        child: StreamBuilder(
          stream: magnetometerListener,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              // Tangani error di sini
              return Text("Sensor Tidak Ditemukan atau Tidak Tersedia");
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return SizedBox();

              default:
                final xAxis = snapshot.data!.x.toString().substring(0, 3);
                final yAxis = snapshot.data!.y.toString().substring(0, 3);
                final zAxis = snapshot.data!.z.toString().substring(0, 3);
                double xA = snapshot.data!.x;
                double yA = snapshot.data!.y;
                double zA = snapshot.data!.z;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   'assets/images/Basketball.png',
                    //   width: 100,

                    // ),
                    Stack(children: [
                      Transform(
                        transform: Matrix4.identity()
                          ..translate(
                              xA, yA, zA), // Mengatur translasi x, y, dan z
                        child: Image.asset(
                          'assets/images/Magnet.png',
                          width: 100,
                        ),
                      ),
                    ]),

                    Text(
                      "X-Axis : $xAxis",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Y-Axis : $yAxis",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Z-Axis : $zAxis",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
