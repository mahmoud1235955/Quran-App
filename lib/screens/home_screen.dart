import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:lottie/lottie.dart';
import 'package:quranapp/constant/extentions.dart';
import 'package:quranapp/cubit/salwat_time/cubit/salwat_time_cubit.dart';
import 'package:quranapp/cubit/surahCategory/cubit/surah_category_cubit.dart';
import 'package:quranapp/cubit/timer/cubit/timer_cubit.dart';
import 'package:quranapp/generated/l10n.dart';
import 'package:quranapp/routes/screen_routes.dart';
import 'package:quranapp/widgets/elevaed_button_widget.dart';
import 'package:quranapp/widgets/surah_category_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> azkarList = [
      "أذكار الصباح",
      "أذكار المساء",
      "أذكار بعد الصلاة",
    ];
    List<String> azkarEndPoint = [
      "azkar_sabah.json",
      "azkar_massa.json",
      "PostPrayer_azkar.json",
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TimerCubit()..startTimer()),
        BlocProvider(
          create: (context) => SalwatTimeCubit()..getSalwatTime(city: "Cairo"),
        ),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: BlocProvider(
            create: (context) => SurahCategoryCubit(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Positioned(
                      right: 0,
                      child: Image.asset(
                        "assets/image/2.png",
                        width: 200,
                        height: 200,
                      ),
                    ),
                    BlocBuilder<TimerCubit, DateTime>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: MediaQuery.sizeOf(context).width),
                            Text(
                              S.of(context).myQuran,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff9543FF),
                              ),
                            ),
                            Text(
                              S.of(context).BacaAlQuranDeganMudah,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffA8A8A8),
                              ),
                            ),
                            Text(
                              S.of(context).commonCurrentTime(state),
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff232323),
                              ),
                            ),
                            Text(
                              S
                                  .of(context)
                                  .commonHijriDate(
                                    HijriCalendar.fromDate(
                                      state,
                                    ).toFormat("dd MMMM yyyy ").toString(),
                                  ),
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff232323),
                              ),
                            ),
                            BlocBuilder<SalwatTimeCubit, SalwatTimeState>(
                              builder: (context, state) {
                                if (state is SalwatTimeLoading) {
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.white,
                                    child: Container(width: 117, height: 29),
                                  );
                                } else if (state is SalwatTimeLoaded) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        ScreenRoutes.salwatTime,
                                        arguments: [state.salwatTime],
                                      );
                                    },
                                    child: Container(
                                      // padding: const EdgeInsets.only(left: 24),
                                      margin: const EdgeInsets.only(top: 11),
                                      width: 117,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff9543FF),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Center(
                                        child: Text(
                                          state.salwatTime.nextPray,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Text("Error");
                                }
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                44.gap,
                Text(
                  S.of(context).Kategori,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff232323),
                  ),
                ),
                11.gap,
                BlocBuilder<SurahCategoryCubit, SurahCategoryState>(
                  builder: (context, state) {
                    int index = 0;
                    if (state is SurahCategoryLoaded) {
                      index = state.index;
                    }
                    return Row(
                      children: [
                        ElevaedButtonWidget(
                          color: index == 0
                              ? const Color(0xff9543FF)
                              : Colors.white,
                          onPressed: () {
                            context.read<SurahCategoryCubit>().changeIndex(0);
                            context.read<SurahCategoryCubit>().getCategory();
                          },
                          label: S.of(context).label1,
                          textColor: index == 0
                              ? Colors.white
                              : const Color(0xff9543FF),
                        ),
                        12.gap,
                        ElevaedButtonWidget(
                          color: index == 1
                              ? const Color(0xff9543FF)
                              : Colors.white,
                          onPressed: () {
                            context.read<SurahCategoryCubit>().changeIndex(1);
                          },
                          label: S.of(context).label2,
                          textColor: index == 1
                              ? Colors.white
                              : const Color(0xff9543FF),
                        ),
                      ],
                    );
                  },
                ),
                20.gap,
                Expanded(
                  child: BlocBuilder<SurahCategoryCubit, SurahCategoryState>(
                    builder: (context, state) {
                      if (state is SurahCategoryLoading) {
                        return Center(
                          child: Lottie.asset(
                            'assets/lottie/Quran.json',
                            width: 100,
                            height: 100,
                          ),
                        );
                      } else if (state is SurahCategoryLoaded &&
                          state.index == 0) {
                        return ListView.separated(
                          padding: const EdgeInsets.only(bottom: 20),
                          itemCount: state.surah.length,
                          separatorBuilder: (context, index) => 20.gap,
                          itemBuilder: (context, index) {
                            return SurahCategoryWidget(
                              isTrailing: state.index == 0,
                              surah: state.surah[index],
                              surahNumber: index + 1,
                            );
                          },
                        );
                      } else if (state is SurahCategoryLoaded &&
                          state.index == 1) {
                        return ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
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
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            ScreenRoutes.azkariScreen,
                                            arguments: azkarEndPoint[index],
                                          );
                                        },

                                        title: Text(azkarList[index]),
                                        trailing: SizedBox(),
                                        leading: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/image/muslim (1) 1.png",
                                            ),
                                            Text((index + 1).toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return 20.gap;
                          },
                          itemCount: 3,
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
