import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/cubit/qibla/cubit/qibla_cubit.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => QiblaCubit()..getQibla(),
        child: BlocBuilder<QiblaCubit, QiblaState>(
          builder: (context, state) {
            if (state is QiblaLoading) {
              return Center(child: const CircularProgressIndicator());
            }

            if (state is QiblaLoaded) {
              return Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Image.asset('assets/image/qibla.png'),
                    // AnimatedRotation(
                    //   turns: state.angle / (2 * pi), // تحويل الراديان إلى دورات
                    //   duration: const Duration(milliseconds: 300), // وقت التنعيم
                    //   curve: Curves.easeOut, // شكل الحركة
                    //   child: Image.asset('assets/image/qibla.jpg'),
                    // ),
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: state.angle),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,

                      builder: (context, angle, child) {
                        return Transform.rotate(
                          angle: angle,
                          child: Image.asset('assets/image/qibla.jpg'),
                        );
                      },
                    ),
                  ],
                ),
              );
            }

            if (state is QiblaError) {
              return Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              );
            }

            return ElevatedButton(
              onPressed: () => context.read<QiblaCubit>().getQibla(),
              child: const Text("تفعيل القبلة"),
            );
          },
        ),
      ),
    );
  }
}
