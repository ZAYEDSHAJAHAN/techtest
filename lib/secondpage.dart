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
int remi = 0;
num qui = 0;
int rvalue = 0;
var boxid = 0;
int randombox = 0;
List randomidList = [];

class _secondpageState extends State<secondpage> {
  @override
  void initState() {
    super.initState();

    random(widget.data.val);
    setState(() {
      remi = widget.data.val % 3;
      qui = widget.data.val ~/ 3;
      if (widget.data.val < 3) {
        pvalue = widget.data.val - 3;
      }

      if (remi > 3) {
        rvalue = remi - 3;
      } else {
        rvalue = remi;
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
            if (remi == 0) ...[
              for (int i = 0; i < qui; i++) con(3, 0, i)
            ] else ...[
              for (int i = 0; i < qui; i++) con(widget.data.val, rvalue, i),
              con1(widget.data.val, rvalue)
            ]
          ],
        ),
      ),
    ));
  }

  Widget con(val, reminvalue, int k) {
    BoxDecoration h;
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Row(
        children: [
          if (reminvalue == 0) ...[
            for (int j = 0; j < val; j++)
              Padding(
                padding: const EdgeInsets.all(5),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      randomidList.add(randombox);
                    });

                    print(randomidList);
                    if (randomidList.contains(randombox)) {
                      random(val);
                    } else {
                      random(val);
                    }
                  },
                  child: Container(
                    height: 12.h,
                    width: 12.h,
                    decoration: (randombox == boxid)
                        ? myBoxDecoration2()
                        : myBoxDecoration1(),
                    child: Text(tempid(k, j).toString()),
                  ),
                ),
              ),
          ] else ...[
            for (int j = 0; j < 3; j++)
              Padding(
                padding: EdgeInsets.all(1.h),
                child: InkWell(
                  child: Container(
                    height: 12.h,
                    width: 12.h,
                    decoration: (randombox == boxid)
                        ? myBoxDecoration2()
                        : myBoxDecoration1(),
                    child: Text(tempid(k, j).toString()),
                  ),
                  onTap: () {
                    random(val);
                    myBoxDecoration3();
                  },
                ),
              ),
          ]
        ],
      ),
    );
  }

  Widget con1(val, reminvalue) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Row(
        children: [
          for (int j = 0; j < reminvalue; j++)
            Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 12.h,
                  width: 12.h,
                  color: Colors.grey,
                  child: Text(tempidblance(val, reminvalue).toString()),
                ),
              ),
            ),
        ],
      ),
    );
  }

  tempid(j, k) {
    // print("k =" + k.toString());
    // print("j= " + j.toString());
    int counterid = k + j + (2 * j);
    // print("counter id= " + counterid.toString());
    setState(() {
      boxid = counterid;
    });
    return counterid;
  }

  random(val) {
    Random random = new Random();
    int randomNumber = random.nextInt(val - 1);

    print("random number is " + randomNumber.toString());
    setState(() {
      randombox = randomNumber;
    });
    return randomNumber;
  }
}

BoxDecoration myBoxDecoration2() {
  return BoxDecoration(color: Colors.blueAccent);
}

BoxDecoration myBoxDecoration3() {
  return BoxDecoration(color: Colors.greenAccent);
}

BoxDecoration myBoxDecoration1() {
  return BoxDecoration(color: Colors.grey);
}

tempidblance(passingvalue, balancebox) {
  print("passingvalue " + passingvalue.toString());
  print("balancebox " + balancebox.toString());
  return 0;
}
