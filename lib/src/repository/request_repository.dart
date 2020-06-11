import 'package:front_archetype/src/api_service/request_api_service.dart';
import 'package:front_archetype/src/models/request/request_create.dart';
import 'package:front_archetype/src/models/request/request_mail.dart';
import 'package:front_archetype/src/models/response/api_response.dart';

class RequestRepository {
  
  final _requestApiService = RequestApiService();

  Future<ApiResponse> sendRequestMail(RequestMail request) => _requestApiService.sendRequestMail(request);
  Future<ApiResponse> createRequest(RequestCreate request) => _requestApiService.createRequest(request);

}