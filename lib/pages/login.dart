import 'package:flutter/material.dart';
import 'package:venuebooking_app/components/or_divider.dart';
import 'package:venuebooking_app/constants.dart';
import 'package:venuebooking_app/pages/signup.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({ Key key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email = "";
  var password = "";
  bool _obscureText = true;
   AnimationController _controller;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Material(
        child: SingleChildScrollView(
            child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF7643),
                    Color(0xFFFF7643),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 36.0, horizontal: 24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 46.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Book your venue",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  )),
                                   child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:   Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Color(0xFF000000)),
                      cursorColor: Color(0xFF9b9b9b),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail_outline),
                          border: OutlineInputBorder(),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Email"),
                      validator: (emailValue) {
                        if (emailValue.isEmpty) {
                          return 'Please enter email';
                        }
                        email = emailValue;
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(color: Color(0xFF000000)),
                      cursorColor: Color(0xFF9b9b9b),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: _toggle,
                          ),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Password"),
                      obscureText: _obscureText,
                      validator: (emailValue) {
                        if (emailValue.isEmpty) {
                          return 'Please enter password';
                        }
                        email = emailValue;
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Forget Password?',
                      style: TextStyle(color: Colors.black, fontSize: 15.0)),
                ),
              ),
              GestureDetector(
                onTap: () => {
                 
                },
                child: InkWell(
                  child: Container(

                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Center(
                        child: Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    )),
                  ),
                ),
              ),
             OrDivider(),
             
              
              GestureDetector(
                onTap: () {
                  Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(10.0),
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1.0),
                        top: BorderSide(color: Colors.grey, width: 1.0),
                        right: BorderSide(color: Colors.grey, width: 1.0),
                        left: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(child: Text("New? Create an Account")),
                ),
              )
            ],
          ),
        ),
      ),
    ))]))));
  }
}
