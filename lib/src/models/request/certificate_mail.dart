class CertificateMail {
  
  List<String> filesPath;
  String link;
  String to;
  String typeCertificate;

  CertificateMail({
    this.filesPath,
    this.link,
    this.to,
    this.typeCertificate
  });

  factory CertificateMail.fromJson(Map<String, dynamic> json) {
    return CertificateMail(
      filesPath: (json['filesPath'] as List<String>).map((i) => i).toList(),
      link: json['link'] as String,
      to: json['to'] as String,
      typeCertificate: json['typeCertificate'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'filesPath': filesPath,
    'link': link,
    'to': to,
    'typeCertificate': typeCertificate
  };

}