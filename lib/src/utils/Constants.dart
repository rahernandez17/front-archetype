import 'package:flutter/cupertino.dart';

class Constants {

  //Strings
  static const String appName = "Certificados UNIAJC";
  static const String homeName = "Home";

  //Fonts
  static const String robotoFont = "Roboto";
  static const String ralewayFont = "Raleway";

  //Colors
  static const Color bluePrimary = Color(0xFF0050a0);
  static const Color blueSecondary = Color(0xFF002850);

  //Routes
  static const String root = "/";
  static const String homeRoute = "/home";

  //URL
  //static const String urlBase = "smartdev.uniajc.edu.co:8888";
  //static const String urlService = "/demo_raul-0.0.1-SNAPSHOT";
  //static const String urlSaludo = "/home";
  static const String urlBase = "192.168.0.3:8080";

  //Routes certificate service
  static const String urlCertificateService = "/certificados-0.0.1-SNAPSHOT";
  static const String urlCertificateSendMail = "/mail/send";

  //Routes request service
  static const String urlRequestService = "/solicitudes-0.0.1-SNAPSHOT";
  static const String urlRequestSendMail = "/email/solicitud";
  static const String urlRequestCreateRequest = "/request/insert";

  //Token
  //Es provisional mientras se hace el login
  //Se debe renovar
  static const String token = 'eyJhbGciOiJIUzUxMiJ9.eyJhY2MiOjY0ODYzLCJzdWIiOiJyYXVsYWhlcm5hbmRleiIsImNyZWF0ZWQiOjE1OTE1NjcxNDQ4MDAsImV4cCI6MTU5MTY1MzU0NCwiaWF0IjoxNTkxNTY3MTQ0fQ.HcqmEl4RynEtp2Rfh5vANoAsRn_YTqTwsSjWfZNfbRzUBkjt0AggUBVc1VgTgocC4l6R1Z_hMBWzQ_E8S264CQ';
  

  //Error Messages
  static const String withoutConnectionMsg = "La conexión con el servicio no se pudo realizar";
}