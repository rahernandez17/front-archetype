import 'package:flutter_test/flutter_test.dart';
import 'package:front_archetype/src/bloc/saludo_bloc.dart';
import 'package:front_archetype/src/models/saludo.dart';

void main(){

  String nombre;
  SaludoBloc saludoBloc;

  setUp(() {
    nombre = "Fernando";
    saludoBloc = SaludoBloc();
  });

  group('Testing SaludoBloc', () {
    test('.saludar() devuelve un saludo', () {
      final saludo = Saludo(saludo: "Hola, $nombre. Saludando desde el servicio");
      Future<Saludo> future = saludoBloc.saludar(nombre);
      future.then((Saludo s) {
        expect(saludo.saludo, s.saludo);
      });
    });

    test('.saludar() es un saludo. Usando async', () async {
      var future = await saludoBloc.saludar(nombre);
      expect(future, isA<Saludo>());
    });
  });

}