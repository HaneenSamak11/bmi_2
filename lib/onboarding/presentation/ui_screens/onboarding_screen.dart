import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/main_info/presentation/ui_screens/main_info_screen.dart';
import 'package:flutter_application_1/onboarding/presentation/comonents/custom_button.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: AppColors.burble,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                    Text(
                      'Know Your Body Better ,Get Your BMI Score in Less Than a Minute!',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Text(
                      'It takes just 30 seconds – and your health is worth it!',
                      style: TextStyle(color: AppColors.white2),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Divider(),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    CustomButton(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => MainInfoScreen(),
                        // ));
                        //
                        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainInfoScreen(),), (_)=>false);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => MainInfoScreen(),
                          ),
                        );
                      },
                      title: 'Get Started',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.23,
            top: MediaQuery.of(context).size.height * 0.10,
            child: SvgPicture.asset('assets/images/Group (1).svg'),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.17,
            top: MediaQuery.of(context).size.height * 0.26,
            child: Center(child: SvgPicture.asset('assets/images/Group.svg')),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.62,
            top: MediaQuery.of(context).size.height * 0.17,
            child: SvgPicture.asset('assets/images/Group (2).svg'),
          ),
        ],
      ),
    );
  }
}
