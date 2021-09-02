import 'package:flutter/material.dart';
import 'package:venuebooking_app/constants.dart';

import '../size_config.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.check_circle,
        color: kPrimaryColor,
        size: 200),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your response has been submitted!",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              
            ))
          ],
        )
      ],
 ) );
  }
}
