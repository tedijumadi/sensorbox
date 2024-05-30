import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:memory_info/memory_info.dart';

class MemoriInfoPage extends StatefulWidget {
  const MemoriInfoPage({Key? key}) : super(key: key);

  @override
  State<MemoriInfoPage> createState() => _MemoriInfoPageState();
}

class _MemoriInfoPageState extends State<MemoriInfoPage> {
  Memory? _memory;
  DiskSpace? _diskSpace;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Panggil getMemoryInfo() saat inisialisasi widget
    getMemoryInfo();

    // Atur timer untuk memperbarui informasi setiap 5 detik (sesuaikan sesuai kebutuhan)
    _timer = Timer.periodic(Duration(seconds: 2), (Timer t) => getMemoryInfo());
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> getMemoryInfo() async {
    Memory? memory;
    DiskSpace? diskSpace;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      memory = await MemoryInfoPlugin().memoryInfo;
      diskSpace = await MemoryInfoPlugin().diskSpace;
    } on PlatformException catch (e) {
      print('error $e');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    if (memory != null || diskSpace != null)
      setState(() {
        _memory = memory;
        _diskSpace = diskSpace;
      });
  }

  @override
  void dispose() {
    // Hentikan timer saat widget dihapus
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String memInfo = encoder.convert(_memory?.toMap());
    String diskInfo = encoder.convert(_diskSpace?.toMap());

    // Ambil nilai 'usedByApp' dari JSON _memory dan tampilkan di dalam widget Text
    String usedByAppValue = _memory?.toMap()['usedByApp']?.toString() ?? 'N/A';
    String totalValue = _memory?.toMap()['total']?.toString() ?? 'N/A';
    String freeValue = _memory?.toMap()['free']?.toString() ?? 'N/A';
    String lowMemoryValue = _memory?.toMap()['lowMemory']?.toString() ?? 'N/A';

    String diskFreeSpaceValue =
        _diskSpace?.toMap()['diskFreeSpace']?.toString() ?? 'N/A';
    String diskTotalSpaceValue =
        _diskSpace?.toMap()['diskTotalSpace']?.toString() ?? 'N/A';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Memory Info",
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
                    "Memory info, atau informasi memori, merujuk pada data atau parameter yang menyediakan informasi tentang status dan karakteristik memori dalam suatu sistem komputer atau perangkat elektronik. Ini mencakup berbagai aspek, termasuk kapasitas memori, jenis memori, penggunaan memori saat ini, dan parameter lain yang berkaitan dengan penyimpanan dan pengelolaan data.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MemInfo:\n',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Text('$memInfo'),
            Text('Used by App: $usedByAppValue'),
            Text('Total: $totalValue'),
            Text('Free: $freeValue'),
            Text('LowMemory: $lowMemoryValue'),
            Text('DiskFreeSpace: $diskFreeSpaceValue'),
            Text('DiskTotalSpace: $diskTotalSpaceValue'),
            Text('\n--------------------------------------------\n'),
            Text(
              'DiskInfo:\n',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Text('$diskInfo')
          ],
        ),
      ),
    );
  }
}
