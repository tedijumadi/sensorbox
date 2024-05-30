import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelometerPage extends StatefulWidget {
  const AccelometerPage({super.key});

  @override
  State<AccelometerPage> createState() => _AccelometerPageState();
}

class _AccelometerPageState extends State<AccelometerPage> {
  final accelometerListener = accelerometerEvents;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0A2F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Accelometer Sensor",
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
                    "Accelerometer adalah jenis sensor yang digunakan untuk mengukur percepatan linier, yaitu perubahan kecepatan suatu objek dalam suatu arah tertentu. Sensor ini dapat mendeteksi perubahan percepatan, baik itu percepatan positif (peningkatan kecepatan) atau percepatan negatif (pengurangan kecepatan). Percepatan diukur dalam satuan meter per detik kuadrat (m/s²) atau g.",
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
          stream: accelometerListener,
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
