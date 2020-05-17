class ApiResponse {
  
  int codigo;
  String mensaje;
  dynamic valor;

  ApiResponse({ 
    this.codigo,
    this.mensaje,
    this.valor
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      codigo: json['codigo'],
      mensaje: json['mensaje'],
      valor: json['valor']
    );
  }

  Map<String, dynamic> toJson() => {
    'codigo': codigo,
    'mensaje': mensaje,
    'valor': valor,
  };

}