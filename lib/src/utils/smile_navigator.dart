import 'package:flutter/material.dart';
import 'package:front_archetype/src/utils/constants.dart';

//Clase para administrar las navegaciones de la aplicación
class SmileNavigator {

  //Context = Donde está
  //Constants.home = Donde quiero que vaya
  static void goToHome(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(Constants.homeRoute, (Route<dynamic> route) => false);
  }

}