import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroscopePage extends StatefulWidget {
  const GyroscopePage({super.key});

  @override
  State<GyroscopePage> createState() => _GyroscopePageState();
}

class _GyroscopePageState extends State<GyroscopePage> {
  final gyroscopeListener = gyroscopeEvents;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0A2F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Gyroscope Sensor",
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
                    "Gyroscope sensor, atau sensor giroskop, adalah perangkat yang digunakan untuk mengukur tingkat perubahan sudut atau kecepatan angular suatu objek. Sensor ini bekerja berdasarkan prinsip kekekalan momentum sudut, yaitu prinsip bahwa suatu objek akan tetap pada posisi dan orientasinya kecuali ada gaya eksternal yang bekerja padanya.",
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
          stream: gyroscopeListener,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              // Tangani error di sini
              return Text(
                "Sensor Tidak Ditemukan atau Tidak Tersedia",
                style: TextStyle(color: Colors.white),
              );
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return SizedBox();

              default:
                final xAxis = snapshot.data!.x.toString().substring(0, 3);
                final yAxis = snapshot.data!.y.toString().substring(0, 3);
                final zAxis = snapshot.data!.z.toString().substring(0, 3);
                double xA = snapshot.data!.x * -10;
                double yA = snapshot.data!.y * 20;
                double zA = snapshot.data!.z * 10;
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
                          'assets/images/Basketball.png',
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
