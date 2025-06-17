import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  const ButtonWidget({super.key, this.buttonText = "", this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.2,
          padding: EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: onPressed,
        child: Center(child: Text(buttonText,
        style: TextStyle(
           fontSize: 18,
           fontWeight: FontWeight.bold
        ))),
      ),
    );
  }
}
