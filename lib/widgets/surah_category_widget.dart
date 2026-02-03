import 'package:flutter/material.dart';
import 'package:quranapp/constant/extentions.dart';
import 'package:quranapp/models/surah_model.dart';
import 'package:quranapp/routes/screen_routes.dart';

class SurahCategoryWidget extends StatelessWidget {
  const SurahCategoryWidget({
    super.key,
    required this.surah,
    required this.surahNumber,
    required this.isTrailing,
  });
  final int surahNumber;
  final SuraModel surah;
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
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ScreenRoutes.ayatScreen,
                    arguments: surahNumber,
                  );
                }, //https://quranapi.pages.dev/api/112.json
                title: Text(surah.surahName),
                subtitle: Row(
                  children: [
                    Text(surah.revelationPlace),
                    5.gap,
                    Text("${surah.totalAyah.toString().toUpperCase()}   Ayat"),
                  ],
                ),
                trailing: isTrailing
                    ? Text(
                        surah.surahNameArabic,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff863ED5),
                        ),
                      )
                    : SizedBox(),
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
