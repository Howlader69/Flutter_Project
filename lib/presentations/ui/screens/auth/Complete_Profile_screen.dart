import 'package:ecomerce_project/presentations/ui/screens/auth/Otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utility/imager_assets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
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
                  height: 20,
                ),
                Center(
                    child: SvgPicture.asset(
                  ImagesAssets.craftBayLogoSVG,
                  width: 100,
                )),
                const SizedBox(height: 16,),
                Text('Complete Profile',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 24)),
                const SizedBox(height: 6,),
                Text(
                  'Get Started with us with your details',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 18,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'First Name'
                  ),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Last Name'
                  ),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Mobile'
                  ),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'City'
                  ),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(
                      hintText: 'Shipping address'
                  ),
                ),
                const SizedBox(height: 8,),
                SizedBox(
                  width: double.infinity,
                    child: ElevatedButton(

                        onPressed: () {
                        }, child: const Text('Complete'))),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
