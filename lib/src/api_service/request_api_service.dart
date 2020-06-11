import 'dart:convert';
import 'dart:io';

import 'package:front_archetype/src/exceptions/response_error_exception.dart';
import 'package:front_archetype/src/exceptions/without_connection_exception.dart';
import 'package:front_archetype/src/models/request/request_create.dart';
import 'package:front_archetype/src/models/request/request_mail.dart';
import 'package:front_archetype/src/models/response/api_response.dart';
import 'package:front_archetype/src/utils/constants.dart';
import 'package:http/http.dart' as http;

class RequestApiService {

  RequestApiService();

  Future<ApiResponse> sendRequestMail(RequestMail request) async {
    var response = ApiResponse(code: 0, message: "", value: "");
    Uri url = Uri.http(Constants.urlBase, Constants.urlRequestService + Constants.urlRequestSendMail);
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

  Future<ApiResponse> createRequest(RequestCreate request) async {
    var response = ApiResponse(code: 0, message: "", value: "");
    Uri url = Uri.http(Constants.urlBase, Constants.urlRequestService + Constants.urlRequestCreateRequest);
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