import 'package:flutter/material.dart';
import 'package:venuebooking_app/components/search/search_field.dart';
import 'package:venuebooking_app/constants.dart';
import 'package:venuebooking_app/cutsomshapeclipper.dart';

import '../../search_page.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(
                      
                        colors: [kPrimaryColor, kSecondaryColor])),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Where do you want to book your venue?",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            )
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchPage(),
              ),
            ),
            child: SearchField(),
          ),
        )
      ],
    );
  }
}
