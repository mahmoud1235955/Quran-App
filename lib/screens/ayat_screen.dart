import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/constant/extentions.dart';
import 'package:quranapp/cubit/audio/cubit/audio_cubit.dart';
import 'package:quranapp/cubit/ayat/cubit/ayat_cubit.dart';
import 'package:quranapp/widgets/ayat_widget.dart';
import 'package:shimmer/shimmer.dart';

class AyatScreen extends StatelessWidget {
  const AyatScreen({super.key});

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    int surhNumber = ModalRoute.of(context)?.settings.arguments as int;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AyatCubit()..getAyah(surahNumber: surhNumber),
        ),
        BlocProvider(create: (context) => AudioCubit()),
      ],
      child: BlocBuilder<AyatCubit, AyatState>(
        builder: (context, ayatState) {
          if (ayatState is AyatLoading) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ListView.builder(
                  itemCount: 10, // عرض 10 آيات وهمية
                  itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: ListTile(
                      title: Container(
                        height: 20,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      subtitle: Container(
                        height: 15,
                        width: 150,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (ayatState is AyatLoaded) {
            final audioUrl =
                ayatState.ayatList.audio?.reciters.isNotEmpty ?? false
                ? ayatState.ayatList.audio!.reciters[0].url
                : "";
            return Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 52),
                    child: Center(
                      child: Text(
                        ayatState.ayatList.surahName ?? "",
                        style: const TextStyle(
                          color: Color(0xFF9543FF),
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    ayatState.ayatList.revelationPlace ?? "",
                    style: const TextStyle(fontSize: 16),
                  ),

                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      itemBuilder: (context, index) {
                        return AyatWidget(
                          surahName: ayatState.ayatList.surahName ?? "",
                          revelationPlace:
                              ayatState.ayatList.revelationPlace ?? "",
                          arabicAyah: ayatState.ayatList.arabic1![index],
                          englishAyah: ayatState.ayatList.english![index],
                          ayahNumber: index + 1,
                        );
                      },
                      separatorBuilder: (context, index) => 10.gap,
                      itemCount: ayatState.ayatList.arabic1!.length,
                    ),
                  ),
                  BlocBuilder<AudioCubit, AudioState>(
                    builder: (context, audioState) {
                      Duration currentPos = Duration.zero;
                      Duration totalDuration = const Duration(seconds: 1);
                      bool isPlaying = false;
                      if (audioState is AudioProgress) {
                        currentPos = audioState.position;
                        totalDuration = audioState.duration.inSeconds > 0
                            ? audioState.duration
                            : const Duration(seconds: 1);
                        isPlaying = audioState.isPlaying;
                      }

                      return Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xff9543FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Slider(
                              activeColor: Colors.white,
                              inactiveColor: Colors.white24,
                              value: currentPos.inSeconds.toDouble(),
                              max: totalDuration.inSeconds.toDouble(),
                              onChanged: (value) {
                                context.read<AudioCubit>().audioSeek(
                                  seconds: value.toInt(),
                                );
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _formatDuration(currentPos),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (isPlaying) {
                                      context.read<AudioCubit>().audioPause();
                                    } else {
                                      context.read<AudioCubit>().playAudio(
                                        url: audioUrl,
                                      );
                                    }
                                  },
                                  icon: Icon(
                                    isPlaying
                                        ? Icons.pause_circle
                                        : Icons.play_circle,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                                Text(
                                  _formatDuration(totalDuration),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Scaffold(body: Center(child: Text("Error")));
          }
        },
      ),
    );
  }
}
