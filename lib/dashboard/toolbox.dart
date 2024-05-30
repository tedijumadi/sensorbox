import 'package:flutter/material.dart';
import 'package:sensorbox/feature/flash_light_page.dart';
import 'package:sensorbox/feature/memory_info_page.dart';
import 'package:sensorbox/feature/nfc_page.dart';

class ToolBox extends StatelessWidget {
  const ToolBox({Key? key}) : super(key: key);

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
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemoriInfoPage(),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust the padding as needed
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/images/Memory Slot.png',
                              width: 90, height: 90),
                          Visibility(
                            visible: false,
                            child: Image.asset('assets/images/Lock.png',
                                width: 70, height: 70),
                          ),
                        ],
                      ),
                      Text(
                        'Memory Info',
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
                    builder: (context) => FlashLightPage(),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust the padding as needed
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/images/Flash Light.png',
                              width: 90, height: 90),
                          Visibility(
                            visible: false,
                            child: Image.asset('assets/images/Lock.png',
                                width: 70, height: 70),
                          ),
                        ],
                      ),
                      Text(
                        'Flash Light',
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
                    builder: (context) => NfcPage(),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust the padding as needed
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/images/Nfc.png',
                              width: 90, height: 90),
                          Visibility(
                            visible: false,
                            child: Image.asset('assets/images/Lock.png',
                                width: 70, height: 70),
                          ),
                        ],
                      ),
                      Text(
                        'Nfc',
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
        ],
      ),
    );
  }
}
