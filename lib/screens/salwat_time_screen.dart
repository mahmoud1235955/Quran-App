import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quranapp/constant/extentions.dart';
import 'package:quranapp/cubit/timer/cubit/timer_cubit.dart';
import 'package:quranapp/generated/l10n.dart';
import 'package:quranapp/models/salwat_time_model.dart';
import 'package:quranapp/widgets/custom_list_tile.dart';

class SalwatTimeScreen extends StatelessWidget {
  const SalwatTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<SalwatTimeModel> argList =
        ModalRoute.of(context)!.settings.arguments as List<SalwatTimeModel>;
    final SalwatTimeModel salwatTime = argList[0];
    return BlocProvider(
      create: (context) => TimerCubit(),
      child: Scaffold(
        backgroundColor: Color(0xff180B37),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.45,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 0,
                    child: Image.asset(
                      "assets/image/mosque.png",
                      height: MediaQuery.sizeOf(context).height * 0.5 - 6,
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 27,
                    child: Text(
                      "Jadwal Salwat",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 27,
                    child: Text(
                      "Cairo, Egypt",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 27,
                    child: StreamBuilder(
                      // بيدي نبضة كل ثانية عشان الودجت تعمل Rebuild
                      stream: Stream.periodic(const Duration(seconds: 1)),
                      builder: (context, snapshot) {
                        // 1. نادي على الـ Duration المتبقي من الـ Extension اللي إنت لسه مصلحه
                        // الـ remainingTimeDuration جواه دلوقتي الـ Logic بتاع الـ difference
                        Duration remaining = salwatTime.remainingTimeDuration;

                        // 2. استخدم دالة الـ format اللي إنت كاتبها برضه في الـ Extension
                        String timeStr = salwatTime.formatDuration(remaining);

                        return Text(
                          timeStr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize:
                                30, // كبرت الخط شوية عشان الـ Timer هيبان أشيك كدة
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 24,
                    right: 26,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 47,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 190,
                    right: 0,
                    left: 0,
                    child: Text(
                      salwatTime.nextPray,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    top: 230,
                    right: 0,
                    left: 0,
                    child: Text(
                      "The difference between a believer and a non-believer is the abandonment of prayer.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  BlocBuilder<TimerCubit, DateTime>(
                    builder: (context, state) {
                      return Positioned(
                        top: MediaQuery.sizeOf(context).height * 0.5 - 100,
                        right: 35,
                        left: 35,
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            S
                                .of(context)
                                .commonHijriDate(
                                  HijriCalendar.fromDate(
                                    state,
                                  ).toFormat("dd MMMM yyyy ").toString(),
                                ),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff232323),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    10.gap,
                    CustomListTile(
                      text: "${salwatTime.fajr}",
                      icon: Icons.timer,
                      title: "Fajr",
                    ),
                    CustomListTile(
                      text: "${salwatTime.sunrise}",
                      icon: Icons.sunny,
                      title: "Sunrise",
                    ),
                    CustomListTile(
                      text: "${salwatTime.dhuhr}",
                      icon: Icons.sunny,
                      title: "Dhuhr",
                    ),
                    CustomListTile(
                      text: "${salwatTime.asr}",
                      icon: Icons.cloud,
                      title: "Asr",
                    ),
                    CustomListTile(
                      text: "${salwatTime.sunset}",
                      icon: Icons.cloud,
                      title: "Sunset",
                    ),

                    CustomListTile(
                      text: "${salwatTime.maghrib}",
                      icon: Icons.timer,
                      title: "Maghrib",
                    ),
                    CustomListTile(
                      text: "${salwatTime.isha}",
                      icon: Icons.timer,
                      title: "Isha",
                    ),
                    CustomListTile(
                      text: "${salwatTime.imsak}",
                      icon: Icons.cloud,
                      title: "Imsak",
                    ),
                    CustomListTile(
                      text: "${salwatTime.midnight}",
                      icon: Icons.timer,
                      title: "Midnight",
                    ),
                    CustomListTile(
                      text: "${salwatTime.firstthird}",
                      icon: Icons.timer,
                      title: "First Third",
                    ),
                    CustomListTile(
                      text: "${salwatTime.lastthird}",
                      icon: Icons.timer,
                      title: "Last Third",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
