import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'iconsassets/mydropdownicon.dart';

class DefaultButtonHome extends StatelessWidget {
  final String text;

  const DefaultButtonHome({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r))),
          backgroundColor: MaterialStateProperty.all(Color(0xff21262C))),
      onPressed: () {},
      child: Center(
          child: SizedBox(
        height: 65.h,
        width: 254.w,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 50.w),
              child: Icon(
                Mydropdownicon.icon_dropdown_me,
                size: 30.h,
                color: Color.fromARGB(218, 255, 208, 0),
              ),
            ),
            Text(
              '$text',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(218, 255, 208, 0),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
