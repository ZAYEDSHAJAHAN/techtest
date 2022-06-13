import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:techtest/firstpage.dart';
import 'dart:math';

class secondpage extends StatefulWidget {
  final Digit data;
  const secondpage({Key? key, required this.data}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

int pvalue = 0;

class _secondpageState extends State<secondpage> {
  @override
  void initState() {
    super.initState();
    random(widget.data.val);
    setState(() {
      if (widget.data.val < 3) {
        pvalue = widget.data.val - 3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (int i = 0; i < widget.data.val; i++) con(widget.data.val)
          ],
        ),
      ),
    ));
  }

  // Widget con(val) {
  //   return Column(children: [
  //     for (int i = 0; i < 8; i++)
  //       for (int j = 0; j <= i; j++)
  //         Padding(
  //           padding: EdgeInsets.all(2.h),
  //           child: Container(
  //             height: 12.h,
  //             width: 12.h,
  //             color: Colors.blueAccent,
  //             child: Text(val.toString()),
  //           ),
  //         ),
  //   ]);
  // }

  Widget con(val) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Row(
        children: [
          if (val <= 3) ...[
            for (int j = 0; j < val; j++)
              Padding(
                padding: const EdgeInsets.all(5),
                child: InkWell(
                  onTap: () {
                    // print(arg);
                  },
                  child: Container(
                    height: 12.h,
                    width: 12.h,
                    color: Colors.grey,
                    child: Text(val.toString()),
                  ),
                ),
              ),
          ] else ...[
            Container(
              height: 12.h,
              width: 12.h,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5.w,
            ),
            Container(
              height: 12.h,
              width: 12.h,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5.w,
            ),
            Container(
              height: 12.h,
              width: 12.h,
              color: Colors.grey,
            ),
          ]
        ],
      ),
    );
  }
}

random(val) {
  Random random = new Random();
  int randomNumber = random.nextInt(val);
  return print("random number is " + randomNumber.toString());
}
