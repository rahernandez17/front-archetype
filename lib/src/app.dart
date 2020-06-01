import 'package:flutter/material.dart';
import 'package:front_archetype/src/providers/push_notifications_provider.dart';
import 'package:front_archetype/src/ui/home/home_ui.dart';
import 'package:front_archetype/src/ui/splash/splash_ui.dart';
import 'package:front_archetype/src/utils/constants.dart';

class App extends StatefulWidget {
  
  @override
  _AppState createState() => _AppState();

}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    final pushProvider = PushNotificationProvider();
    //Obtener token de FCM

/*
  INSERT INTO app_certificados.usuario(usu_usuario, usu_token_notify, usu_estado, usu_tipo_dispositivo, usu_pege_id)
	VALUES ('raulahernandez',
			'caM3dEgOihY:APA91bGS50Zf2-2QirtVYJLptPaKQItZZllZ_U_s3iAoz0_DS9KOo-6_QLCigvJ-ibUaYX-b73r3mdCzJLaz2HC8HeT4TBzxe2FkDUmulXrMM9BFR1zFXvvsHHqh7Sm3pibxA36veGsE',
			true, 'ANDROID', 10102); 
 */

    pushProvider.initNotifications();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: Constants.robotoFont
      ),
      initialRoute: Constants.root,
      routes: {
        Constants.root: (context) => SplashPage(),
        Constants.homeRoute: (context) => HomePage(),
      },
    );
  }
}
