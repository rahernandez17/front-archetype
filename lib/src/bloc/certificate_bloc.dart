import 'package:front_archetype/src/exceptions/custom_exception.dart';
import 'package:front_archetype/src/models/request/certificate_mail.dart';
import 'package:front_archetype/src/models/response/api_response.dart';
import 'package:front_archetype/src/repository/certificates_repository.dart';

class CertificateBloc {

  final CertificateRepository _repository = CertificateRepository();

  Future<String> enviarCertificado() async {
    var datos = CertificateMail(
      filesPath: ["https://vadimdez.github.io/ng2-pdf-viewer/assets/pdf-test.pdf"],
      link: "https://www.youtube.com/watch?v=5xyHWKvn3eU",
      to: "raulandres462@gmail.com",
      typeCertificate: "certificado de estudio"
    );
    var operation = ApiResponse(code: 0, message: "", value: "");
    try {
      operation = await _repository.sendCertificateToMail(datos);
    } catch (e) {
      operation.message = (e as CustomException).message;
    }
    return operation.message;
  }

}