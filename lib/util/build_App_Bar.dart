import 'package:car_rental_app/data/constants.dart';
import 'package:car_rental_app/util/build_Container.dart';
import 'package:flutter/material.dart';

/**
 * @author Punithraj
 */

class BuildAppBar extends StatelessWidget {
  final String iconUrl;
  final Function func;

  const BuildAppBar({Key key, this.iconUrl, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: func,
          child: BuildContainer(
            color: maccentColor,
            child: Image(
              image: AssetImage(iconUrl),
              color: Colors.white,
            ),
          ),
        ),
        Spacer(),
        BuildContainer(
          color: maccentColor,
          child: Image(
            image: AssetImage('assets/icons/search.png'),
            color: Colors.white,
          ),
        ),
        SizedBox(width: 15,),
        BuildContainer(
          color: maccentColor,
          child: Image(
            image: AssetImage('assets/icons/adjust.png'),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
