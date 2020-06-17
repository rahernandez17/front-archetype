import 'package:dio/dio.dart';

class Receipt {

  final Dio dio = Dio();

  Future<void> descargarRecibo(String url, String savePath, ProgressCallback progress) async {
    try {
      final response = await dio.download(url, savePath, onReceiveProgress: progress);
      print(response);
    } catch (e) {
      print("No se pudo descargar el archivo");
    }
  }

}