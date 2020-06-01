import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {

  /**
   * 
   * Voy en el vídeo 5 del tutorial
   * https://www.youtube.com/watch?v=pswT-gzRf_o&list=PLCKuOXG0bPi375T5P1UAK1QjYaF6jUKBP&index=7
   */

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _messagesStreamController = StreamController<String>.broadcast();

  Stream<String> get mensajes => _messagesStreamController.stream;

  initNotifications() async {
    _firebaseMessaging.requestNotificationPermissions();
    String token = await _firebaseMessaging.getToken();
    //Almacenar en BD
    //Mostrar en consola el token
    print('=== FCM Token ===');
    print(token);
    //Configurar métodos
    _firebaseMessaging.configure(
      onMessage: (info) {
        String argumento = 'no-data';
        print('=== On Message ===');
        print(info);
        if (Platform.isAndroid) {
          //nombre es el parametro que se manda en la notificación
          //Se puede editar
          argumento = info['data']['nombre'] ?? 'no-data';
        }
        _messagesStreamController.sink.add(argumento);
        return;
      },
      onLaunch: (info) {
        print('=== On Launch ===');
        print(info);
        return;
      },
      onResume: (info) {
        print('=== On Resume ===');
        print(info);
        return;
      },
    );
  }

  dispose() {
    _messagesStreamController?.close();
  }

}