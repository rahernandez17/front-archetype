import 'package:front_archetype/src/models/api_response.dart';
import 'package:front_archetype/src/models/saludo_nombre.dart';
import 'package:front_archetype/src/utils/saludo_api_service.dart';

class Repository {
  
  //Api services
  final SaludoApiService saludoApiService = SaludoApiService();

  //Directorio Future
  Future<ApiResponse> saludar(SaludoNombre data) => saludoApiService.getSaludo(data);

}