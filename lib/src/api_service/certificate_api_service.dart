import 'dart:convert';
import 'dart:io';

import 'package:front_archetype/src/exceptions/response_error_exception.dart';
import 'package:front_archetype/src/exceptions/without_connection_exception.dart';
import 'package:front_archetype/src/models/request/certificate_mail.dart';
import 'package:front_archetype/src/models/response/api_response.dart';
import 'package:front_archetype/src/utils/constants.dart';
import 'package:http/http.dart' as http;

class CertificateApiService {

  CertificateApiService();

  //Este método se remueve porque es automático
  //Sólo es para efectos de prueba y demostración
  Future<ApiResponse> sendCertificateToMail(CertificateMail request) async {
    var response = ApiResponse(code: 0, message: "", value: "");
    Uri url = Uri.http(Constants.urlBase, Constants.urlCertificateService + Constants.urlCertificateSendMail);
    http.Response res = null;
    try {
      res = await http.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: Constants.token
        },
        body: json.encode(request)
      );
    } catch (e) {
      throw WithoutConnectionException(Constants.withoutConnectionMsg);
    }
    response = ApiResponse.fromJson(json.decode(res.body) as Map<String, dynamic>);
    if(res.statusCode == 200) {
      response.value = response.value as String;
    } else {
      throw ResponseErrorException(response.message);
    }
    return response;
  }

}