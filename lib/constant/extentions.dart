import 'package:flutter/material.dart';
import 'package:quranapp/models/salwat_time_model.dart';

extension gap1 on num {
  SizedBox get gap => SizedBox(height: this.toDouble(), width: this.toDouble());
}

extension nextPrayTime on SalwatTimeModel {
  String get nextPray {
    DateTime now = DateTime.now();
    Map<String, String> pray = {
      "الفجر": fajr ?? "",
      "الشروق": sunrise ?? "",
      "الظهر": dhuhr ?? "",
      "العصر": asr ?? "",
      "المغرب": maghrib ?? "",
      "العشاء": isha ?? "",
      "الإمساك": imsak ?? "",
      "الغروب": sunset ?? "",
      "منتصف الليل": midnight ?? "",
      "الثلث الأول": firstthird ?? "",
      "الثلث الأخير": lastthird ?? "",
    };
    try {
      var next = pray.entries.firstWhere((e) {
        if (e.value.trim().isEmpty) return false;
        List<String> time = e.value.split(":");
        DateTime prayTime = DateTime(
          now.day,
          int.parse(time[0]),
          int.parse(time[1]),
        );
        return prayTime.isAfter(now);
      });
      return "${next.key} in ${next.value}";
    } catch (e) {
      return "Fajr Tomorrow";
    }
  }
}

extension timerDiffernce on SalwatTimeModel {
  Duration get remainingTimeDuration {
    DateTime now = DateTime.now();
    Map<String, String> pray = {
      "الفجر": fajr ?? "",
      "الشروق": sunrise ?? "",
      "الظهر": dhuhr ?? "",
      "العصر": asr ?? "",
      "المغرب": maghrib ?? "",
      "العشاء": isha ?? "",
      "منتصف الليل": midnight ?? "",
      "الثلث الأول": firstthird ?? "",
      "الثلث الأخير": lastthird ?? "",
    };

    try {
      var next = pray.entries.firstWhere((element) {
        if (element.value.trim().isEmpty) return false;
        List<String> time = element.value.split(":");

        // التعديل هنا: استخدام DateTime كامل (سنة، شهر، يوم)
        DateTime prayTime = DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(time[0]),
          int.parse(time[1]),
        );

        // لو الصلاة وقتها (كأرقام) أقل من دلوقتي، يبقى يقصد بكره (زي صلاة 1 صباحاً)
        if (int.parse(time[0]) < 5)
          prayTime = prayTime.add(const Duration(days: 1));

        return prayTime.isAfter(now);
      });

      // تحويل الـ String لـ DateTime عشان نعرف نعمل difference
      List<String> nextTimeSplit = next.value.split(":");
      DateTime nextTarget = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(nextTimeSplit[0]),
        int.parse(nextTimeSplit[1]),
      );

      if (int.parse(nextTimeSplit[0]) < 5)
        nextTarget = nextTarget.add(const Duration(days: 1));

      return nextTarget.difference(now); // هنا الـ difference هتشتغل صح
    } catch (e) {
      return Duration.zero;
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }
}
