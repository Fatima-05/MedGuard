import 'package:flutter/material.dart';

import '../colors.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:const AppNavBar(),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Image.asset(
                      'assets/images/medguard_logo.png',
                      width:72,
                      height:72,
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'MedGuard',
                      style: TextStyle(
                        fontSize:30,
                        fontWeight: FontWeight.w800,
                        color: AppColors.teal900,
                      ),
                    ),
                    const SizedBox(height:6),
                    const Text(
                      'Medication interaction checker for caregivers',
                      textAlign:TextAlign.center,
                      style:TextStyle(
                        fontSize:13,
                        color: AppColors.slate500,
                      ),
                    ),
                    const SizedBox(height:26),
                    ClipRRect(
                      borderRadius:BorderRadius.circular(20),
                      child:Image.asset(
                        'assets/images/landing_banner.png',
                        height:140,
                        fit:BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height:30),
                    const CircularProgressIndicator(
                      strokeWidth:3,
                      color: AppColors.teal600,
                    ),
                  ],
                ),
              ),
              const Text(
                'Not a substitute for professional medical advice.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.slate400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
