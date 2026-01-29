import 'package:flutter/material.dart';
import 'package:quranapp/generated/l10n.dart';
import 'package:quranapp/routes/screen_routes.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.sizeOf(context).width, height: 139),
          Image.asset("assets/image/1.png"),
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
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 150),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(181, 53),
              backgroundColor: Color(0xff9543FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, ScreenRoutes.homeScreen);
            },
            child: Text(
              S.of(context).BacaSekarang,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
