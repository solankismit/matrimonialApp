import 'package:flutter/material.dart';
  List<String> heightList = [
    "4’0”",
    "4’1”",
    "4’2”",
    "4’3”",
    "4’4”",
    "4’5”",
    "4’6”",
    "4’7”",
    "4’8”",
    "4’9”",
    "4’10”",
    "4’11”",
    "5’0”",
    "5’1”",
    "5’2”",
    "5’3”",
    "5’4”",
    "5’5”",
    "5’6”",
    "5’7”",
    "5’8”",
    "5’9”",
    "5’10”",
    "5’11”",
    "6’0”",
    "6’1”",
    "6’2”",
    "6’3”",
    "6’4”",
    "6’5”",
    "6’6”",
    "6’7”",
    "6’8”",
    "6’9”",
    "6’10”",
    "6’11”",
    "7’0”",
    "7’1”",
    "7’2”",
    "7’3”",
    "7’4”",
    "7’5”",
    "7’6”",
    "7’7”",
    "7’8”",
    "7’9”",
    "7’10”",
    "7’11”",
  ];

class HeightAlert extends StatelessWidget {
  final TextEditingController controller;

  HeightAlert({Key? key,required this.controller}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ), //this right here
      child: Container(
        height: screenHeight * 0.4,
        width: double.minPositive,
        // padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(16)),
        child: ListView.builder(
            itemCount: heightList.length,
            itemBuilder: ((context, index) {
              // var server =
              //     snapshots.data?.data![index];

              // if (j == 11) {
              //   i++;
              //   j = 0;
              // } else {
              //   j++;
              // }
              return Column(
                children: [
                  // Text(i.toString() + "'" + j.toString() + "\""),
                  // InkWell(child: Text(height[index])),
                  Container(
                    padding: const EdgeInsets.all(0),
                    width: 120,
                    height: 40,
                    child: TextButton(
                        onPressed: () {
                          String height = heightList[index].toString();
                          controller.text = height;
                          Navigator.pop(context);
                        },
                        child: Text(
                          heightList[index],
                          style: TextStyle(
                              color:
                              Color(0xff3C0A53),
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 18),
                        )),
                  ),

                  Text("-----------------")
                ],
              );
            })),
      ),
    );
  }
}
