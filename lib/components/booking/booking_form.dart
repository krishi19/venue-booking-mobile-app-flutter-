// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:venuebooking_app/constants.dart';
// import 'package:venuebooking_app/screens/home/components/body.dart';

// class BookingForm extends StatefulWidget {
//   const BookingForm({Key key}) : super(key: key);

//   @override
//   _BookingFormState createState() => _BookingFormState();
// }

// class _BookingFormState extends State<BookingForm> {
//   DateTime _date = new DateTime.now();
//   Future<Null> _selectDate(BuildContext context) async {
//     DateTime _datePicker = await showDatePicker(
//       context: context,
//       initialDate: _date,
//       firstDate: new DateTime(1999),
//       lastDate: new DateTime(2022),
//     );
//     if (_datePicker != null && _datePicker != _date) {
//       setState(() {
//         _date = _datePicker;
//         print('_date.toString()}');
// // setState(() {
// //       _date = _datePicker;
//       });
//     }
//   }
//    String PayDropdownValue = 'Payment';
//   String _phoneNumber;
//   String _name;
//   String _email;
//   String _password;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         child: SingleChildScrollView(
//             child: Container(
//                 constraints: BoxConstraints(
//                   maxHeight: MediaQuery.of(context).size.height,
//                   maxWidth: MediaQuery.of(context).size.width,
//                 ),
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                   colors: [
//                     Color(0xFFFF7643),
//                     Color(0xFFFF7643),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.centerRight,
//                 )),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 36.0, horizontal: 24.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                 "Book Now",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 46.0,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10.0,
//                               ),
//                               Text(
//                                 "Book your venue",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 22.0,
//                                   fontWeight: FontWeight.w300,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                           flex: 5,
//                           child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(40),
//                                     topRight: Radius.circular(40),
//                                   )),
//                               child: Padding(
//                                 padding: EdgeInsets.all(10.0),
//                                 child: Container(
//                                   padding: const EdgeInsets.all(20.0),
//                                   child: Column(
//                                     children: [
//                                       Form(
//                                           key: _formKey,
//                                           child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 TextFormField(
//                                                   decoration: InputDecoration(
//                                                       labelText: 'Name'),
//                                                   maxLength: 10,
//                                                   validator: (String value) {
//                                                     if (value.isEmpty) {
//                                                       return 'Name is Required';
//                                                     }

//                                                     return null;
//                                                   },
//                                                   onSaved: (String value) {
//                                                     _name = value;
//                                                   },
//                                                 ),
//                                                 TextFormField(
//                                                   decoration: InputDecoration(
//                                                       labelText: 'Email'),
//                                                   validator: (String value) {
//                                                     if (value.isEmpty) {
//                                                       return 'Email is Required';
//                                                     }

//                                                     if (!RegExp(
//                                                             r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
//                                                         .hasMatch(value)) {
//                                                       return 'Please enter a valid email Address';
//                                                     }

//                                                     return null;
//                                                   },
//                                                   onSaved: (String value) {
//                                                     _email = value;
//                                                   },
//                                                 ),
//                                                 TextFormField(
//                                                   decoration: InputDecoration(
//                                                       labelText:
//                                                           'Phone number'),
//                                                   keyboardType:
//                                                       TextInputType.phone,
//                                                   validator: (String value) {
//                                                     if (value.isEmpty) {
//                                                       return 'Phone number is Required';
//                                                     }

//                                                     return null;
//                                                   },
//                                                   onSaved: (String value) {},
//                                                 ),
//                                                 TextFormField(
//                                                   decoration: InputDecoration(
//                                                     labelText:
//                                                           'Date',
//                                                     suffixIcon: Container(
//                                                       child: FlatButton(
//                                                         onPressed: () {
//                                                           _selectDate(context);
//                                                         },
//                                                         child: Icon(Icons
//                                                             .calendar_today),
//                                                       ),
//                                                     ),
                                                   
                                                    
//                                                   ),
//                                                 ),
                                                
                
//                 // Container(
//                 //   padding: EdgeInsets.only(left: 8),
                 
//                 //   child: DropdownButton<String>(
//                 //     underline: Container(),
//                 //     elevation: 0,
//                 //     isExpanded: true,
//                 //     icon: Icon(Icons.arrow_drop_down),
//                 //     value: PayDropdownValue,
//                 //     onChanged: (String newValue) {
//                 //       setState(
//                 //         () {
//                 //           PayDropdownValue = newValue;
//                 //         },
//                 //       );
//                 //     },
//                 //     items: <String>['Payment' ,'Cash on visit', 'e-pay']
//                 //         .map<DropdownMenuItem<String>>((String value) {
//                 //       return DropdownMenuItem<String>(
//                 //         value: value,
//                 //         child: Text(value),
//                 //       );
//                 //     }).toList(),
//                 //   ),
//                 // ),
                                             
//                                                 Padding(
//                                                   padding: EdgeInsets.fromLTRB(
//                                                       150, 0, 0, 0),
//                                                   child: RaisedButton(
//                                                       child: Text(
//                                                         'Pay',
//                                                         style: TextStyle(
//                                                             color:
//                                                                 kPrimaryColor,
//                                                             fontSize: 16),
//                                                       ),
//                                                       onPressed: () {
//                                                         if (!_formKey
//                                                             .currentState
//                                                             .validate()) {
//                                                           return;
//                                                         }

//                                                         _formKey.currentState
//                                                             .save();
//                                                       }),
//                                                 )
//                                               ])),
//                                     ],
//                                   ),
//                                 ),
//                               )))
//                     ]))));
//   }
// }

// @override
// Widget build(BuildContext context) {
//   // TODO: implement build
//   throw UnimplementedError();
// }
