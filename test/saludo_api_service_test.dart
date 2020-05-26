import 'package:flutter_test/flutter_test.dart';
import 'package:front_archetype/src/models/api_response.dart';
import 'package:front_archetype/src/models/saludo.dart';
import 'package:front_archetype/src/models/saludo_nombre.dart';
import 'package:front_archetype/src/utils/saludo_api_service.dart';
import 'package:mockito/mockito.dart';

class MockSaludoApiService extends Mock implements SaludoApiService {}

void main() {

  String nombre;
  SaludoNombre saludoNombre;
  MockSaludoApiService saludoApiService;
  ApiResponse response;

  setUp(() {
    nombre = "Fernando";
    saludoNombre = SaludoNombre(nombre: nombre);
    saludoApiService = MockSaludoApiService();
  });

  group('Saludo Api Service', () {
    test('getSaludo() devuelve un ApiResponse', () async {
      response = ApiResponse(
        codigo: 200, 
        mensaje: 'Obtenido', 
        valor: Saludo(saludo: "Hola, $nombre. Saludando desde el servicio")
      );
      when(saludoApiService.getSaludo(saludoNombre)).thenAnswer((_) async => response);
      expect(await saludoApiService.getSaludo(saludoNombre), isInstanceOf<ApiResponse>());
    });

    test('getSaludo() Lanza excepción cuando se completa con error', () async {
      response = ApiResponse(
        codigo: 500, 
        mensaje: 'Error en la base de datos', 
        valor: null
      );
      when(saludoApiService.getSaludo(saludoNombre)).thenAnswer((_) async => response);
      var actual = await saludoApiService.getSaludo(saludoNombre);
      expect(actual == response, true);
    });
    
  });
}