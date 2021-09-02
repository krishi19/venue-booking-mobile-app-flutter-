import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venuebooking_app/bloc/home_bloc.dart';
import 'package:venuebooking_app/components/booking/booking.dart';

class BookingForm extends StatefulWidget {
  final venueId;
  final name;
  final address;
  final price;
  final picture;
  BookingForm({
    Key key,
    this.venueId,
    this.name,
    this.address,
    this.price,
    this.picture,
  }) : super(key: key);

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  DateTime _date = new DateTime.now();

  String _fullName;

  String _email;

  String _contact;
  String _location;
  String _noOfPeople;

  Future<Null> _selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(1999),
      lastDate: new DateTime(2022),
    );
    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
        print(_date);
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF7643),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Book Venue Now",
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Full Name'),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Name is Required';
                              }

                              return null;
                            },
                            onChanged: (String value) {
                              _fullName = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email'),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Email is Required';
                              }

                              if (!RegExp(
                                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email Address';
                              }

                              return null;
                            },
                            onChanged: (String value) {
                              _email = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Contact'),
                            keyboardType: TextInputType.phone,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Phone number is Required';
                              }

                              return null;
                            },
                            onChanged: (String value) {
                              _contact = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Location'),
                            onChanged: (String value) {
                              _location = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Number of people'),
                            keyboardType: TextInputType.number,
                            onChanged: (String value) {
                              _noOfPeople = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Number of people is required';
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: _date.toString(),
                              border: OutlineInputBorder(),
                              labelText: 'Date',
                              suffixIcon: Container(
                                child: FlatButton(
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                  child: Icon(Icons.calendar_today),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          var response = await homeBloc.postBooking(
                            contact: _contact,
                            date: _date,
                            email: _email,
                            fullName: _fullName,
                            location: _location,
                            peopleNumber: _noOfPeople,
                            venueId: widget.venueId,
                          );
                          print(response);
                          if (response?.statusCode == 200) {
                            Fluttertoast.showToast(
                                msg:
                                    "Booking created and mail sent successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);

                            // var booking = {
                            //   'name': "${widget.name}",
                            //   'address': "${widget.address}",
                            //   'price': "${widget.price}",
                            //   'picture': "${widget.picture}"
                            // };
                            // SharedPreferences prefs =
                            //     await SharedPreferences.getInstance();

                            // print('ok first');
                            // if (prefs.containsKey("bookings")) {
                            //   print("object");
                            //   List data = prefs.getStringList('bookings');
                            //   data.add(booking);
                            //   // data.push(booking);
                            //   prefs.setStringList("bookings", data);
                            // } else {
                            //   var data = new List();
                            //   data.add(json.encode(booking));
                            //   print('ok second');

                            //   prefs.setStringList("bookings", data);
                            // }

                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            List<String> details = prefs.getStringList("key");
                            print(details);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Booking(
                                  details: details,
                                ),
                              ),
                            );
                          }
                          print("response ${response.statusCode}");
                        }
                      },
                      color: Color(0xFFFF7643),
                      textColor: Colors.white,
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
