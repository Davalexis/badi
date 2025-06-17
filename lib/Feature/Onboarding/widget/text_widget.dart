import 'package:flutter/widgets.dart';
import 'package:badi/Core/constants/Colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Text(
            'badi',
            style: TextStyle(
              fontSize: 40,
              color: kPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            '     Ultimate Platform for \n Seamless Messaging and \n Connected Conversation!',
            style: TextStyle(
              fontSize: 23,
              color: kText,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ],
    
    );
  }
}
