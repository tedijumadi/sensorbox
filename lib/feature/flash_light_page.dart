import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:control_center/control_center.dart';

class FlashLightPage extends StatefulWidget {
  const FlashLightPage({Key? key}) : super(key: key);

  @override
  State<FlashLightPage> createState() => _FlashLightPageState();
}

class _FlashLightPageState extends State<FlashLightPage> {
  final _controlCenterPlugin = ControlCenter();
  String _platformVersion = 'Unknown';
  int _batteryLevel = 0;

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    String platformVersion;
    int batteryLevel;

    try {
      platformVersion = await _controlCenterPlugin.getPlatformVersion() ??
          'Unknown platform version';
      batteryLevel = await _controlCenterPlugin.getBatteryLevel() ?? 0;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      batteryLevel = 0;
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Flashlight Page',
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
                    "flashlight atau flash light adalah sumber cahaya portabel yang digunakan untuk memberikan penerangan dalam kondisi yang minim cahaya. Flashlight seringkali dirancang untuk digunakan secara sementara dan mudah dibawa-bawa, sehingga sangat umum digunakan dalam kegiatan seperti camping, kegiatan luar ruangan, atau dalam situasi darurat ketika penerangan listrik tidak tersedia. ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Android: $_platformVersion\n'),
            Text('Battery: $_batteryLevel %\n'),
            TextButton(
              child: Text('ON/OFF'),
              onPressed: () async {
                await _controlCenterPlugin.openOrCloseFlashlight();
              },
            ),
          ],
        ),
      ),
    );
  }
}
