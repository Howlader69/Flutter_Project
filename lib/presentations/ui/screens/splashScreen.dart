
import 'package:ecomerce_project/presentations/state_holders/Auth_controller.dart';
import 'package:ecomerce_project/presentations/ui/screens/auth/email_verification_screen.dart';
import 'package:ecomerce_project/presentations/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecomerce_project/presentations/ui/utility/imager_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    super.initState();
    gotoNextScreen();
  }
  Future<void> gotoNextScreen() async {
    await AuthController.getAccessToken();
    Future.delayed(Duration(seconds: 3)).then((value) => {
      Get.offAll(() => AuthController.isLoggedIn
              ? const MainBottomNavScreen()
              : const EmailVerificationScreen()),
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(child: SvgPicture.asset(ImagesAssets.craftBayLogoSVG,width: 100,)),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 16,),
            const Text('version 1.0.0'),
            const SizedBox(height: 16,)
          ],
        ),
    );
  }
}
