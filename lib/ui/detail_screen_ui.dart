import 'package:car_rental_app/data/constants.dart';
import 'package:car_rental_app/model/car_details.dart';
import 'package:car_rental_app/util/build_App_Bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * @author Punithraj
 */

class DetailScreen extends StatefulWidget {
  final CarDetails carDetails;

  const DetailScreen({Key key, this.carDetails}) : super(key: key);



  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mPrimaryColor,
      body: Padding(
        padding: EdgeInsets.only(left: mpadding, right: mpadding,top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BuildAppBar(
              iconUrl: 'assets/icons/left-arrow.png',
              func: () {Navigator.of(context).pop();}
            ),
            SizedBox(height: 20,),
            _buildRichText(),
            Hero(
                tag: widget.carDetails.id, 
                child: Container(
                  width: double.infinity,
                  height: 170,
                  child: Image.asset(widget.carDetails.imageUrl,fit: BoxFit.cover,),
                )
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildCircleAvatar(Colors.grey),
                SizedBox(width: 10,),
                _buildCircleAvatar(Colors.white),
                SizedBox(width: 10,),
                _buildCircleAvatar(Colors.grey),
                SizedBox(width: 10,),
                _buildCircleAvatar(Colors.grey),
              ],
            ),
            _buildText('Specification'),
            BuildGrid(),
            _buildText('Gallery'),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNav(widget.carDetails.price),
    );
  }

  _buildRichText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${widget.carDetails.type}\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 35,
              letterSpacing: 1.1
            ),
          ),
          TextSpan(
            text: '${widget.carDetails.name}\n',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                letterSpacing: 1.5
            ),
          )
        ]
      ),
    );
  }

  CircleAvatar _buildCircleAvatar(Color color){
    return CircleAvatar(
      radius: 6,
      backgroundColor: color,
    );
  }

  _buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 1.1,
      ),
    );
  }
}

buildBottomNav(double price) {
  return Stack(
    children: <Widget>[
      Container(
        width: double.infinity,
        height: 60,
        color: maccentColor,
      ),
      Row(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: mpadding),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Per Day\n',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      letterSpacing: 1.1,
                    )
                  ),
                  TextSpan(
                      text: '\$$price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[300],
                        fontSize: 25,
                        letterSpacing: 1.1,
                      )
                  ),
                ]
              ),
            ),
          ),
          Spacer(),
          Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: mbottonColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text(
                    'Rent Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

          )
        ],
      )
    ],
  );
}

class BuildGrid extends StatelessWidget {
  final List<Map<String, dynamic>> specification = [
    {
      'icon': 'assets/icons/engine.png',
      'title': 'Engine Power',
      'description': '650 CV (463 KW)',
      'color': maccentColor
    },
    {
      'icon': 'assets/icons/windshield.png',
      'title': 'Accleration',
      'description': '0-200 km/hr - 3.5s',
      'color': Colors.blueGrey[700]
    },
    {
      'icon': 'assets/icons/dashboard.png',
      'title': 'Max Speed',
      'description': '432 km/hr',
      'color': maccentColor
    },
    {
      'icon': 'assets/icons/information.png',
      'title': 'Max Torque',
      'description': '523Nm @6.700 rpm',
      'color': maccentColor
    },
    {
      'icon': 'assets/icons/breakdown.png',
      'title': 'Breaks',
      'description': '8 Pistons(front)',
      'color': maccentColor
    },
    {
      'icon': 'assets/icons/climatization.png',
      'title': 'Seats',
      'description': '2 Seats',
      'color': maccentColor
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: specification.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemBuilder: (context,index) => GridItem(
            color: specification[index]['color'],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(specification[index]['icon'],
                  height:45,
                  width:45 ,
                  color: Colors.grey,
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: FittedBox(
                    child: Text(
                      specification[index]['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 1.1
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    child: Text(
                      specification[index]['description'],
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          letterSpacing: 1.1
                      ),
                    ),
                  ),
                )
              ],
            ),
            
          )
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final Widget child;
  final Color color;

  const GridItem({Key key, this.color, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}







