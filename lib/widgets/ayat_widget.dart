import 'package:flutter/material.dart';
import 'package:quranapp/constant/extentions.dart';

class AyatWidget extends StatelessWidget {
  const AyatWidget({
    super.key,
    required this.surahName,
    required this.revelationPlace,
    required this.arabicAyah,
    required this.englishAyah,
    required this.ayahNumber,
  });

  final String surahName;
  final String revelationPlace;
  final String arabicAyah;
  final String englishAyah;
  final int ayahNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            arabicAyah,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color(0xFF240F4F),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: const Color(0xFF863ED5),
            radius: 13.5,
            child: Text(
              ayahNumber.toString(),
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    englishAyah,
                    style: const TextStyle(
                      color: Color(0xFF240F4F),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  20.gap,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF863ED5).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/image/share_icon.png",
                            width: 24,
                          ),
                        ),
                        16.gap,
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/image/play_icon.png",
                            width: 24,
                          ),
                        ),
                        16.gap,
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/image/save_icon.png",
                            width: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
