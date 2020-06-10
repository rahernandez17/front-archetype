import 'dart:convert';
import 'dart:io';

import 'package:front_archetype/src/exceptions/custom_exception.dart';
import 'package:front_archetype/src/models/request/certificate_mail.dart';
import 'package:front_archetype/src/models/response/api_response.dart';
import 'package:front_archetype/src/utils/constants.dart';
import 'package:http/http.dart' as http;

class CertificateApiService {

  CertificateApiService();

  //http://localhost:8070/api/certificados/
  //Este método se remueve porque es automático
  //Sólo es para efectos de prueba y demostración
  Future<ApiResponse> sendCertificateToMail(CertificateMail request) async {
    var response = ApiResponse(code: 0, message: "", value: "");
    Uri url = Uri.http(Constants.urlBase, Constants.urlCertificateService + Constants.urlurlCertificateSendMail);
    try {
      var res = await http.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: Constants.token
        },
        body: json.encode(request)
      );      
      if(res.statusCode == 200) {
        response = ApiResponse.fromJson(json.decode(res.body) as Map<String, dynamic>);
        response.value = response.value as String;
      } else {
        response.message = "No se pudo obtener";
        response.value = null;
      }
    } on SocketException {
      throw CustomException("La conexión al servicio no se pudo realizar");
    }
    return response;
  }

}