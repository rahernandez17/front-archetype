class SaludoNombre {
  
  final String nombre;

  SaludoNombre({this.nombre});

  factory SaludoNombre.fromJson(Map<String, dynamic> json){
    return SaludoNombre(
      nombre: json['nombre'] as String
    );
  }

  Map<String, dynamic> toJson() => {
    'nombre': nombre,
  };

}