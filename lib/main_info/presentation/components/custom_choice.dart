import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';

class CustomChooice extends StatelessWidget {
  const CustomChooice({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
    required this.isSelected,
  });

  final String imagePath, title;
  final Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          // width: isSelected ? 2:1,
          color: isSelected ? AppColors.deepBurble : Colors.transparent,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imagePath),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
