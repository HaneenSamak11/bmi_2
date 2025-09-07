import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/onboarding/presentation/comonents/custom_button.dart';
import 'package:flutter_application_1/result_screen/domain/entities/bmi_response.dart';
import 'package:flutter_svg/svg.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.name,
    required this.kHeight,
    required this.weight,
  });

  final String name;
  final String kHeight;
  final String weight;

  Future<BmiResponse> calcualtBmi(
    String height,
    String weight, {
    String unit = 'metric',
  }) async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        'https://api.apiverve.com/v1/bmicalculator?height=$height&weight=$weight&unit=$unit',
        options: Options(
          headers: {
            'X-API-Key': "8a79de77-1947-423e-b953-76f5342936c0",
            "Accept": "application/json",
          },
        ),
      );

      return BmiResponse.fromJson((response.data));
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(backgroundColor: AppColors.white),
      body: FutureBuilder<BmiResponse>(
        future: calcualtBmi(kHeight, weight, unit: 'metric'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('there is an error'));
          }
          var data = snapshot.data!.data;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    // height: height * 0.41,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.burble,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                'A 23 years old male.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(height: height * 0.02),
                              Column(
                                children: [
                                  Text(
                                    data.bmi.toStringAsFixed(2),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Text(
                                    'Bmi Calc',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.white,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        kHeight,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        'Height.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                    child: VerticalDivider(
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        weight,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        'Weight',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SvgPicture.asset(
                            'assets/images/Vector.svg',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    padding: EdgeInsets.all(26),
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.green,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          data.risk,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          data.summary,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          data.recommendation,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  CustomButton(
                    title: 'Calculate BMI Again',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
