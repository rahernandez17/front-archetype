class ApiResponse {
  
  int code;
  String message;
  dynamic value;

  ApiResponse({ 
    code,
    message,
    value
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      value: json['value']
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message,
    'value': value,
  };

  bool operator ==(dynamic o) => o is ApiResponse && o.code == code && o.message == message && o.value == value;

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + code.hashCode;
    result = 37 * result + message.hashCode;
    result = 37 * result + value.hashCode;
    return result;
  }

}