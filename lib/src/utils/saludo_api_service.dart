import 'dart:convert';
import 'dart:io';

import 'package:front_archetype/src/models/api_response.dart';
import 'package:front_archetype/src/models/saludo.dart';
import 'package:front_archetype/src/models/saludo_nombre.dart';
import 'package:front_archetype/src/utils/constants.dart';
import 'package:http/http.dart' as http;

class SaludoApiService {

  SaludoApiService();

  Future<ApiResponse> getSaludo (SaludoNombre data) async {
    Uri url = Uri.http(Constants.urlBase, Constants.urlService + Constants.urlSaludo);
    var res = await http.post(url, 
      headers: {
        HttpHeaders.contentTypeHeader: "application/json"
        //HttpHeaders.authorizationHeader: "<TOKEN>"
      },
      body: json.encode(data)
    );
    var response = ApiResponse.fromJson(json.decode(res.body));
    if(res.statusCode == 200){
      response.valor = Saludo.fromJson(json.decode(json.encode(response.valor)));
    } else {
      print("Error!!!!, ${response.mensaje}");
      response.valor = null;
    }
    return response;
  }

}