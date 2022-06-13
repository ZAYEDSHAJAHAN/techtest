import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:techtest/secondpage.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int val = 0;

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(5.h),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("enter your no."),
                  hintText: "enter here below 25"),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_controller.text == "") {
                  print("enter the number");
                } else {
                  int? val = int.tryParse(_controller.text);
                  if (val! <= 25) {
                    print(val);
                    Digit dd = Digit(val);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => secondpage(data: dd)));
                  }
                }
              },
              child: Text("subimit"))
        ],
      ),
    ));
  }
}

class Digit {
  int val;
  Digit(this.val);
}
