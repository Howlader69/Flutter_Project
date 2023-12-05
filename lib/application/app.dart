import 'package:ecomerce_project/application/state_holder_binder.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../presentations/ui/screens/splashScreen.dart';
import '../presentations/ui/utility/App_Colors.dart';

class CraftBay extends StatelessWidget {
  const CraftBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const splashScreen(),
      theme: ThemeData(
        primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors().color),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5
              )
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey
                )
            )
        )
      ),
      initialBinding: StateholderBinder(),
    );
  }
}

