import 'package:flutter/material.dart';
import 'package:quranapp/constant/extentions.dart';

class AzkarWidget extends StatelessWidget {
  AzkarWidget({
    super.key,
    required this.zekrName,
    required this.bless,
    required this.repeat,
  });
  final String zekrName;
  final String bless;
  int repeat;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        children: [
          5.gap,
          Container(
            width: 3,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xff9543FF),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          10.gap,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ExpansionTile(
                onExpansionChanged: (value) {
                  if (value) {
                    repeat--;
                  }
                },
                title: Text(zekrName),
                subtitle: Text(bless),
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/image/muslim (1) 1.png"),
                    Text(repeat.toString()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
