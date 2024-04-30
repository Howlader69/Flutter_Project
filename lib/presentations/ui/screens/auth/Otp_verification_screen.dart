import 'package:ecomerce_project/presentations/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecomerce_project/presentations/ui/utility/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../state_holders/otp_verification_controller.dart';
import '../../utility/imager_assets.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final TextEditingController _otpTEController= TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                    child: SvgPicture.asset(
                  ImagesAssets.craftBayLogoSVG,
                  width: 100,
                )),
                const SizedBox(
                  height: 16,
                ),
                Text('Enter your Otp Code',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 24)),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'A 4 digit Otp Code has been sent',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 18,
                ),
                PinCodeTextField(
                  controller: _otpTEController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.primaryColor,
                      selectedColor: Colors.green),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<OtpVerificationController>(
                      builder: (controller) {
                        if(controller.otpVerificationInProgress){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                            onPressed: () {
                              verifyOtp(controller);
                            },
                            child: const Text('Next'));
                  }
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: [
                      TextSpan(text: 'This Code will expire in'),
                      TextSpan(
                          text: '120s',
                          style: TextStyle(color: AppColors.primaryColor))
                    ])),
                TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Resend',
                          style: TextStyle(color: Colors.grey),
                        )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> verifyOtp(OtpVerificationController controller) async {
    final response =
    await controller.verifyOtp(widget.email, _otpTEController.text.trim());
    if (response) {
      Get.offAll(() => const MainBottomNavScreen());
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Otpo verification failed! try again')));
      }
    }
  }
}
