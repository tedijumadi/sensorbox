import 'package:flutter/material.dart';
import 'package:sensorbox/dashboard/sensorbox.dart';
import 'package:sensorbox/dashboard/toolbox.dart';

class MenuSatu extends StatefulWidget {
  MenuSatu({Key? key}) : super(key: key);

  @override
  State<MenuSatu> createState() => _MenuSatuState();
}

class _MenuSatuState extends State<MenuSatu>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  int get tabBarControllerIndex => tabController.index;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: TabBar(
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          tabs: [
            Tab(
              text: 'Sensor Box',
            ),
            Tab(text: 'Tool Box'),
          ],
          controller: tabController,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Center(child: SensorBox()),
                Center(child: ToolBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
