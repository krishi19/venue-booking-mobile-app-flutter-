
import 'package:flutter/material.dart';
import 'package:venuebooking_app/components/apptextfield.dart';
import 'package:venuebooking_app/components/or_divider.dart';
import 'package:venuebooking_app/constants.dart';
import 'package:venuebooking_app/pages/login.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
      ),
      body: ListView(children: [
        Container(
          height: 200,
          color: kPrimaryColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Venue-App",
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
                Text("Booking in a click!",
                    style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Sign Up',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
          ),
        ),
        // Row(
        //   children: [
        //     Expanded(child: AppTextField(hintText: "First Name")),
        //     Expanded(child: AppTextField(hintText: "Last Name")),
        //   ],
        // ),
         AppTextField(hintText: "Username"),
        AppTextField(hintText: "Email Address"),
        AppTextField(hintText: "Password"),
        Container(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.all(10.0),
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(5.0)),
          child: Center(
              child: Text("Create an Account",
                  style: TextStyle(fontSize: 14, color: Colors.white))),
        ),
        OrDivider(),
        
            FlatButton(onPressed: () {},
              child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                height: 50.0,
               
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: kPrimaryColor, width: 1.0),
                      top: BorderSide(color: kPrimaryColor, width: 1.0),
                      right: BorderSide(color: kPrimaryColor, width: 1.0),
                      left: BorderSide(color: kPrimaryColor, width: 1.0),
                    ),
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                 
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(120, 0, 0, 0)),
                    Image.asset(
                      "assets/images/goooogle.jpg",
                      height: 25.0,
                    ),
                    Text("Sign with google",
                    textAlign: TextAlign.center,
                    ),
                    
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                 Navigator.push(
                          context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(10.0),
              height: 50.0,
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1.0),
                    top: BorderSide(color: Colors.grey, width: 1.0),
                    right: BorderSide(color: Colors.grey, width: 1.0),
                    left: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(child: Text("Have an Account? Login ")),
                      ),
            ),
          ],
        ));
       
  }
}
