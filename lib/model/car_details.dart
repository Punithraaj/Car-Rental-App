
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * @author Punithraj
 */

class CarDetails {
  final int id;
  final double price;
  final String type, name, imageUrl;
  final Color fColor, sColor;

  CarDetails(this.id, this.price, this.type, this.name, this.imageUrl,
      this.fColor, this.sColor);

}
  List<CarDetails> carDetails = [
    CarDetails(
        1,
        325,
        'Jaguar',
        'Jaguar M557',
        'assets/images/ford1.png',
        Colors.blue[600],
        Colors.black87
    ),
    CarDetails(
        2,
        225,
        'Lamborgini',
        'Aventador',
        'assets/images/lamborghini5.png',
        Colors.white70,
        Colors.black87
    ),
    CarDetails(
        3,
        253,
        'Ford',
        'Ford MG57',
        'assets/images/ford3.png',
        Colors.red[300],
        Colors.redAccent[700]
    ),
    CarDetails(
        4,
        250,
        'Ford',
        'Ford GN12',
        'assets/images/ford4.png',
        Colors.limeAccent,
        Colors.teal[900]
    ),
    CarDetails(
        5,
        167,
        'Ford',
        'Huracan',
        'assets/images/ford5.png',
        Colors.black45,
        Colors.black87
    ),
    CarDetails(
        6,
        277,
        'Ferrari',
        'Jagaur',
        'assets/images/ferrari1.png',
        Colors.red[300],
        Colors.redAccent[700]
    ),
    CarDetails(
        7,
        277,
        'Honda',
        'RG5Z',
        'assets/images/honda1.png',
        Colors.white70,
        Colors.blue[700]
    ),
    CarDetails(
        8,
        277,
        'Mercedes',
        'Benz AMG GT',
        'assets/images/mercedes.png',
        Colors.limeAccent,
        Colors.teal[900]
    ),
  ];