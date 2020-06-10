import 'package:front_archetype/src/api_service/certificate_api_service.dart';
import 'package:front_archetype/src/models/request/certificate_mail.dart';
import 'package:front_archetype/src/models/response/api_response.dart';

class CertificateRepository {
  
  final CertificateApiService certificateApiService = CertificateApiService();

  Future<ApiResponse> sendCertificateToMail(CertificateMail request) => certificateApiService.sendCertificateToMail(request);

}