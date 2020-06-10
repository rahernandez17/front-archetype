class CustomException implements Exception { 
  
  String message;

  CustomException(String message){
    this.message = message;
  }

  String errMsg() => message;

} 