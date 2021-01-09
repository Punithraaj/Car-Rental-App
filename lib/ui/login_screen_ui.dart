import 'package:car_rental_app/data/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen_ui.dart';

/**
 * @author Punithraj
 */

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mPrimaryColor,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/welcome.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 80.0,
              child: Padding(
                padding: const EdgeInsets.all(mpadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                              fontSize: 45,
                          ),
                          children: [
                            TextSpan(
                              text: 'Luxury\n'
                            ),
                            TextSpan(
                                text: 'Car Rental\n'
                            ),
                          ]
                        )
                    ),
                    SizedBox(height: 30,width: MediaQuery.of(context).size.width,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(2),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            style: TextStyle(
                              color: Colors.white
                            ),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.white
                              )
                            ),
                          ),
                          SizedBox(height: 16,),
                          TextField(
                            style: TextStyle(
                                color: Colors.white
                            ),
                            decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: Colors.white
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                          )
                        );
                      },
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: mbottonColor,
                        child: Image(
                          image: AssetImage('assets/icons/right-arrow.png'),
                          color: Colors.white,
                          height: 50,
                          width: 35,
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Positioned(
              bottom: mpadding,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: mpadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    buildText('SignUp',17,Colors.blueGrey[400]),
                    SizedBox(width: 20,),
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: Colors.blueGrey[800],
                    ),
                    SizedBox(width: 20,),
                    buildText('Forgot Password',17,Colors.blueGrey[400]),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  buildText(String text, double size, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
      fontSize: size,
    ),
    );
  }
}
