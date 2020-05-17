import 'package:front_archetype/src/models/saludo.dart';
import 'package:front_archetype/src/models/saludo_nombre.dart';
import 'package:front_archetype/src/repository/repository.dart';

class SaludoBloc {

  final Repository _repository = Repository();

  Future<Saludo> saludar(String nombre) async {
    var datos = SaludoNombre(nombre: nombre);
    final saludo = await _repository.saludar(datos);
    if(saludo != null && saludo.codigo == 200) {
      return saludo.valor;
    } else {
      return null;
    }
  }

}