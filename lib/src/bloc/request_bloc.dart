
import 'package:front_archetype/src/exceptions/response_error_exception.dart';
import 'package:front_archetype/src/exceptions/without_connection_exception.dart';
import 'package:front_archetype/src/models/request/request_create.dart';
import 'package:front_archetype/src/models/request/request_mail.dart';
import 'package:front_archetype/src/models/response/api_response.dart';
import 'package:front_archetype/src/repository/request_repository.dart';

class RequestBloc {
  
  final RequestRepository _repository = RequestRepository();

  Future<String> enviarSolicitudEmail() async {
    var datos = RequestMail(
      estDocument: "1144104724",
      estName: "Raul Andres Hernandez Ocampo"
    );
    var operation = ApiResponse(code: 0, message: "", value: "");
    try {
      operation = await _repository.sendRequestMail(datos);
      if(operation.code == 200) {
        operation.message = await crearSolicitud();
      }
    } on WithoutConnectionException catch(e) {
      operation.message = e.message;
    } on ResponseErrorException catch(e) {
      operation.message = e.message;
    }
    return operation.message;
  }

  Future<String> crearSolicitud() async {
    var datos = RequestCreate(
      soEstado: true,
      soFecha: DateTime.now().toString(),
      soUsuarioId: 1
    );
    var operation = ApiResponse(code: 0, message: "", value: "");
    try {
      operation = await _repository.createRequest(datos);
    } on WithoutConnectionException catch(e) {
      operation.message = e.message;
    } on ResponseErrorException catch(e) {
      operation.message = e.message;
    }
    return operation.message;
  }

}