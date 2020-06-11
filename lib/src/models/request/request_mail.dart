class RequestMail {
  
  String estDocument;
  String estName;

  RequestMail({
    this.estDocument,
    this.estName
  });

  factory RequestMail.fromJson(Map<String, dynamic> json) {
    return RequestMail(
      estDocument: json['estDocument'] as String,
      estName: json['estName'] as String
    );
  }

  Map<String, dynamic> toJson() => {
    'estDocument': estDocument,
    'estName': estName
  };

}