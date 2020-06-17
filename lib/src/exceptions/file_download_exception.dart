class FileDownloadException implements Exception { 
  
  String message;

  FileDownloadException(String message){
    this.message = message;
  }

  String errMsg() => message;

}