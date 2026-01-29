import 'package:flutter/material.dart';
import 'package:quranapp/constant/extentions.dart';
import 'package:quranapp/models/surah_model.dart';

class SurahCategoryWidget extends StatelessWidget {
  const SurahCategoryWidget({
    super.key,
    required this.surah,
    required this.surahNumber,
    required this.isTrailing,
  });
  final int surahNumber;
  final SurahModel surah;
  final bool isTrailing;
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
              child: ListTile(
                title: Text(surah.surahName),
                subtitle: Row(
                  children: [
                    Text(surah.revelationPlace),
                    5.gap,
                    Text(surah.totalAyah.toString()),
                  ],
                ),
                trailing: isTrailing ? Text(surah.surahNameArabic) : SizedBox(),
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/image/muslim (1) 1.png"),
                    Text(surahNumber.toString()),
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
