class ResponseErrorException implements Exception { 
  
  String message;

  ResponseErrorException(String message){
    this.message = message;
  }

  String errMsg() => message;

}