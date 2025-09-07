import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/colors.dart';

class CustomTextFormWithLable extends StatelessWidget {
  const CustomTextFormWithLable({
    super.key,
    required this.label,
    required this.controller,
    this.increaseValue,
    this.decreaseValue,
    this.showIncreaseAndDecreaseValue = false,
    this.textInputType,
    this.isInputDigits = false,
    this.validator,
  });

  final String label;
  final TextEditingController controller;
  final Function()? increaseValue;
  final Function()? decreaseValue;
  final bool? showIncreaseAndDecreaseValue;
  final bool? isInputDigits;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          TextFormField(
            validator: validator,
            keyboardType: textInputType,
            inputFormatters:
                isInputDigits!
                    ? [FilteringTextInputFormatter.digitsOnly]
                    : null,
            textAlign:
                showIncreaseAndDecreaseValue!
                    ? TextAlign.center
                    : TextAlign.start,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon:
                  showIncreaseAndDecreaseValue!
                      ? InkWell(onTap: increaseValue, child: Icon(Icons.add))
                      : null,
              prefixIcon:
                  showIncreaseAndDecreaseValue!
                      ? InkWell(onTap: decreaseValue, child: Icon(Icons.remove))
                      : null,
              fillColor: AppColors.burble2,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
