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
      codigo: json['codigo'] as int,
      mensaje: json['mensaje'] as String,
      valor: json['valor']
    );
  }

  Map<String, dynamic> toJson() => {
    'codigo': codigo,
    'mensaje': mensaje,
    'valor': valor,
  };

  bool operator ==(o) => o is ApiResponse && o.codigo == codigo && o.mensaje == mensaje && o.valor == valor;

}