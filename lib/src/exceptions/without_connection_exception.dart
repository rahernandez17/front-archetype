class WithoutConnectionException implements Exception { 
  
  String message;

  WithoutConnectionException(String message){
    this.message = message;
  }

  String errMsg() => message;

}