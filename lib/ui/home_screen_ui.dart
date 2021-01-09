import 'package:car_rental_app/data/constants.dart';
import 'package:car_rental_app/model/car_details.dart';
import 'package:car_rental_app/ui/detail_screen_ui.dart';
import 'package:car_rental_app/util/build_App_Bar.dart';
import 'package:car_rental_app/util/build_Container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * @author Punithraj
 */

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mPrimaryColor,
      body: Padding(
        padding:const EdgeInsets.only(left: mpadding, right: mpadding,top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BuildAppBar(iconUrl :'assets/icons/bell.png'),
            SizedBox(height: 10,),
            _buildText('Choose a Car'),
            BuildTextSwitch(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, i) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: CarItem(
                    carDetails: carDetails[i],
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            carDetails: carDetails[i],
                          )
                        )
                      );
                    },
                  ),
                ),
                itemCount: carDetails.length,
                scrollDirection: Axis.horizontal,
            )
            ),
            _buildText('Top Delars'),
            _buildDelarContainer(Icons.view_week, 'Valley Road Motors',mpinkColor),
            SizedBox(height: 10,),
            _buildDelarContainer(Icons.panorama_fish_eye, 'National Car Rental',mblueColor),
            SizedBox(height: 15,),
          ],
        ),
      ),
      bottomNavigationBar: BuildBottomNavigationBar(),
    );
  }

  Text _buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 1.1
      ),
    );
  }
}

class BuildTextSwitch extends StatefulWidget {
  @override
  _BuildTextSwitchState createState() => _BuildTextSwitchState();
}

class _BuildTextSwitchState extends State<BuildTextSwitch> {
  var driverOn = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'With a Driver',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
            letterSpacing: 1.1,
          ),
        ),
        Spacer(),
        Switch(
          activeColor: Colors.white,
          value: driverOn,
          onChanged: (value){
            setState(() {
              driverOn = value;
            });
          },
        )
      ],
    );
  }
}

class CarItem extends StatefulWidget {
  final CarDetails carDetails;
  final Function press;

  const CarItem({Key key, this.carDetails, this.press}) : super(key: key);

  @override
  _CarItemState createState() => _CarItemState();
}

class _CarItemState extends State<CarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            height: 280,
            width: 215,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [widget.carDetails.fColor,widget.carDetails.sColor],
              )
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.all(mpadding),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${widget.carDetails.type}\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      )
                    ),
                    TextSpan(
                        text: '${widget.carDetails.name}\n',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.1
                        )
                    ),
                  ]
                ),
              ),
            ),
          ),
          Positioned(
              top: 70,
              left: mpadding/20,
              child: Hero(
                tag: widget.carDetails.id,
                child: Image.asset('${widget.carDetails.imageUrl}',width: 220,),
              )
          ),
          Positioned(
            top: 150,
            child: Padding(
              padding: EdgeInsets.all(mpadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Per Day\n',
                            style: TextStyle(
                              color: Colors.white70
                            ),
                          ),
                          TextSpan(
                            text: '\$${widget.carDetails.price}',
                            style: TextStyle(
                                color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ],
                      ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'View Details',
                    style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 1.1,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

_buildDelarContainer(IconData icon, String text, Color color) {
return Container(
  padding: EdgeInsets.all(mpadding/2),
  width: double.infinity,
  height: 75,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.0),
    color: maccentColor,
  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      BuildContainer(
        child: Icon(icon,color: Colors.white,),
        color: color,
      ),
      SizedBox(width: 10.0,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              text,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            '823 Wall Street Apt. 425',
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
              letterSpacing: 1.1
            ),
          ),
        ],
      ),
      Spacer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.star,size: 15,color: Colors.yellow,),
              Icon(Icons.star,size: 15,color: Colors.yellow,),
              Icon(Icons.star,size: 15,color: Colors.yellow,),
              Icon(Icons.star,size: 15,color: Colors.yellow,),
              Icon(Icons.star_border,size: 15,color: Colors.yellow,)
            ],
          ),
          Text(
            '23 Offers',
            style: TextStyle(
                fontSize: 13,
                color: Colors.blueAccent,
                letterSpacing: 1.1
            ),
          ),
        ],
      )
    ],
  ),
);
}

class BuildBottomNavigationBar extends StatefulWidget {
  @override
  _BuildBottomNavigationBarState createState() => _BuildBottomNavigationBarState();
}

class _BuildBottomNavigationBarState extends State<BuildBottomNavigationBar> {
  List<String> bottomNavIcons = [
    'assets/icons/app.png',
    'assets/icons/calendar.png',
    'assets/icons/pin.png',
    'assets/icons/user.png',
  ];
  int selected = 0 ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      color: maccentColor,
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: bottomNavIcons.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              setState(() {
                selected = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: mpadding * 2, left: mpadding),
              child: Image.asset(
                bottomNavIcons[index],
                height: 40,
                color: selected == index ? mbottonColor :Colors.grey,
              ),
            ),
          )
      ),
    );
  }
}





