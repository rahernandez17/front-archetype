class RequestCreate {
  
  bool soEstado;
  String soFecha;
  int soUsuarioId;

  RequestCreate ({
    this.soEstado,
    this.soFecha,
    this.soUsuarioId
  });

  factory RequestCreate.fromJson(Map<String, dynamic> json) {
    return RequestCreate(
      soEstado: json['soEstado'] as bool,
      soFecha: json['soFecha'] as String,
      soUsuarioId: json['soUsuarioId'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'soEstado': soEstado,
    'soFecha': soFecha,
    'soUsuarioId': soUsuarioId
  };

}