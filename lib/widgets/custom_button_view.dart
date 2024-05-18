import 'package:flutter/material.dart';

class CustomButtonView extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final double? width;
  final Color? textColor;
  final double? borderRaidus;

  const CustomButtonView({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.backgroundColor = Colors.black,
    this.width, this.textColor=Colors.white, this.borderRaidus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width??double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          )
        ),
        onPressed: onPressed,
        child: Text(buttonText,style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
