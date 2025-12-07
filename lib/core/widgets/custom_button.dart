import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment_integration/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.buttonText,
    this.isLoading = false,
  });
  final void Function()? onTap;
  final String buttonText;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: Styles.style22,
                ),
        ),
      ),
    );
  }
}
