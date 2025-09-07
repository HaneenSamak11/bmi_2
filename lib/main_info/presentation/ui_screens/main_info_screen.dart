import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/main_info/presentation/components/custom_choice.dart';
import 'package:flutter_application_1/main_info/presentation/components/custom_text_form_with_label.dart';
import 'package:flutter_application_1/onboarding/presentation/comonents/custom_button.dart';
import 'package:flutter_application_1/result_screen/presentation/ui_screens/reslut_screen.dart';

class MainInfoScreen extends StatefulWidget {
  const MainInfoScreen({super.key});

  @override
  State<MainInfoScreen> createState() => _MainInfoScreenState();
}

class _MainInfoScreenState extends State<MainInfoScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController birthDateController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  DateTime? selectedBirthDate;

  bool flage = true;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 40,
            color: AppColors.green,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              CustomTextFormWithLable(
                label: 'Name',
                controller: nameController,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'name can\'t be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.01),
              GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedBirthDate = pickedDate;
                      birthDateController.text =
                          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                    });
                  }
                },
                child: AbsorbPointer(
                  child: CustomTextFormWithLable(
                    label: 'BirthDate',
                    controller: birthDateController,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'birthDate can\'t be empty';
                      }
                      final pattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');
                      if (!pattern.hasMatch(p0)) {
                        return 'please enter valid bithdate ex .2025-08-21';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              /*
                CustomTextFormWithLable(
                  label: 'BirthDate',
                  controller: birthDateController,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'birthDate can\'t be empty';
                    }
                    final pattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');
                    if (!pattern.hasMatch(p0)) {
                      return 'please enter valid bithdate ex .2025-08-21';
                    }
                    return null;
                  },
                ),*/
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  Text(
                    'Choose Gender',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomChooice(
                    imagePath: 'assets/images/male.png',
                    title: 'male',
                    isSelected: flage == true,
                    onTap: () {
                      flage = true;
                      setState(() {});
                    },
                  ),
                  CustomChooice(
                    imagePath: 'assets/images/female.png',
                    title: 'female',
                    isSelected: flage == false,
                    onTap: () {
                      flage = false;
                      setState(() {});
                    },
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              CustomTextFormWithLable(
                label: 'Your Height(cm)',
                controller: heightController,
                showIncreaseAndDecreaseValue: true,
                textInputType: TextInputType.number,
                isInputDigits: true,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Height can\'t be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.01),
              CustomTextFormWithLable(
                label: 'Your Weight(kg)',
                controller: weightController,
                showIncreaseAndDecreaseValue: true,
                textInputType: TextInputType.number,
                isInputDigits: true,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Height can\'t be empty';
                  }
                  return null;
                },
              ),
              Spacer(),
              CustomButton(
                title: 'Calculate BMI',
                onTap: () {
                  // trigger validator
                  if (key.currentState!.validate()) {
                    print(nameController.text);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => ResultScreen(
                              name: nameController.text,
                              kHeight: heightController.text,
                              weight: weightController.text,
                            ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
