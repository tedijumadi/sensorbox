import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'menu1.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Image.asset('assets/images/X-ray.png', height: 400.h, width: 400.w),
            Text(
              "Sensor Box",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 40.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Check sensor from your smartphone",
              style: TextStyle(
                color: Color.fromARGB(225, 225, 225, 225),
                fontSize: 20.sp,
              ),
              maxLines: 2,
            ),
            SizedBox(
              height: 100.h,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuSatu(),
                  ),
                );
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(300, 60)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Color.fromARGB(225, 225, 225, 225),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
