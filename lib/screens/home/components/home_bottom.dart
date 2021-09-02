// import 'package:flutter/material.dart';
// import 'package:venuebooking_app/components/venue/venue.dart';

// class HomeBottomPart extends StatefulWidget {
//   const HomeBottomPart({Key key}) : super(key: key);

//   @override
//   _HomeBottomPartState createState() => _HomeBottomPartState();
// }

// class _HomeBottomPartState extends State<HomeBottomPart> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(
//                   "Featured Venue",
//                   style: Theme.of(context).textTheme.headline5.copyWith(
//                       color: Colors.black, fontWeight: FontWeight.normal),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 480,
//             child: Venue(),
//           )
//         ],
//       ),
//     );
//   }
// }
