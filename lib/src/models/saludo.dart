class Saludo {

  final String saludo;

  Saludo({this.saludo});

  factory Saludo.fromJson(Map<String, dynamic> json){
    return Saludo(
      saludo: json['saludo'] as String
    );
  }

  Map<String, dynamic> toJson() => {
    'saludo': saludo,
  };

}
