import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/constant/extentions.dart';
import 'package:quranapp/cubit/azkar/cubit/azkar_cubit.dart';
import 'package:quranapp/widgets/azkar_widget.dart';

class AzkariScreen extends StatelessWidget {
  const AzkariScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final String endPoint =
        ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => AzkarCubit()..getAzkar(endPoint: endPoint),
      child: BlocBuilder<AzkarCubit, AzkarState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 5,
              shadowColor: Colors.grey,
              backgroundColor: const Color(0xff9543FF),
              title: Text(
                endPoint == "azkar_sabah.json"
                    ? "اذكار الصباح"
                    : endPoint == "azkar_massa.json"
                    ? "اذكار المساء"
                    : "اذكار بعد الصلاة",
              ),
            ),

            body: BlocBuilder<AzkarCubit, AzkarState>(
              builder: (context, state) {
                if (state is AzkarLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AzkarLoaded) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return AzkarWidget(
                          zekrName: state.azkarList[index].zekr,
                          bless: state.azkarList[index].bless,
                          repeat: state.azkarList[index].repeat,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return 10.gap;
                      },
                      itemCount: state.azkarList.length,
                    ),
                  );
                } else if (state is AzkarError) {
                  return Center(child: Text(state.message));
                } else {
                  return SizedBox();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
