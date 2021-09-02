
import 'package:flutter/material.dart';
import 'package:venuebooking_app/constants.dart';


class AboutScreen extends StatefulWidget {


  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFFF7643),
        title: Text('About us'),
        


          ),
         


     body: ListView(children: <Widget>[
          Container(
               
                height: 75.0,
                decoration: BoxDecoration(
                  color: Colors.white
             
                ),
                child: Center(
                  child: Text(
               "What Venue_app offers",
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                ),
               
              ),
          
          Container(
              child:   ListTile(
               title: Text('Incredible choice: one can book venue within a single platform '),
            ),
            
            
          
          
            ),
       

            Container(
              child: ListTile(
                title : Text('Low rates: venue app guarantees to offer you the best available rates. And with our promise to price match, you can rest assured that you’re always getting a great deal.')
              ),
            ),
         
            Container(
              child: ListTile(
                title: Text("No reservation fees: We don’t charge you any booking fees or add any administrative charges. And in many cases, your booking can be cancelled free of charge."),
              ),
            ),
          

       
       Container(
               
                height: 75.0,
                decoration: BoxDecoration(
                  color: Colors.white
             
                ),
                child: Center(
                  child: Text(
                 'contact us : venuea41@gmail.com',
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                ),
               
              ),
        ]));
  }
}
