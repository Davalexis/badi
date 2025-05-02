import 'package:flutter/widgets.dart';
import 'package:badi/constants/Colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 400,
      bottom: 0,

      child: Center(
        child: Text(
          '     Ultimate Platform for \n Seamless Messaging and \n Connected Conversation!',
          style: TextStyle(
            fontSize: 23,
            color: kText,
            fontWeight: FontWeight.w500,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}
