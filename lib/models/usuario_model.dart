class Usuario {
  int? agcCodigo;
  int? usuCodigo;
  String? usuLogin;
  String? usuNome;
  String? usuMail;
  String? usuSexo;
  String? usuCpf;
  String? usuTelefone;
  String? usuDtNascimento;
  String? usuSituacao;

  Usuario(
      {this.agcCodigo,
      this.usuCodigo,
      this.usuLogin,
      this.usuNome,
      this.usuMail,
      this.usuSexo,
      this.usuCpf,
      this.usuTelefone,
      this.usuDtNascimento,
      this.usuSituacao});

  Usuario.fromJson(Map<String, dynamic> json) {
    agcCodigo = json['agcCodigo'] ?? '';
    usuCodigo = json['usuCodigo'] ?? '';
    usuLogin = json['usuLogin'] ?? '';
    usuNome = json['usuNome'];
    usuMail = json['usuMail'];
    usuSexo = json['usuSexo'];
    usuCpf = json['usuCpf'];
    usuTelefone = json['usuTelefone'];
    usuDtNascimento = json['usuDtNascimento'];
    usuSituacao = json['usuSituacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agcCodigo'] = this.agcCodigo;
    data['usuCodigo'] = this.usuCodigo;
    data['usuLogin'] = this.usuLogin;
    data['usuNome'] = this.usuNome;
    data['usuMail'] = this.usuMail;
    data['usuSexo'] = this.usuSexo;
    data['usuCpf'] = this.usuCpf;
    data['usuTelefone'] = this.usuTelefone;
    data['usuDtNascimento'] = this.usuDtNascimento;
    data['usuSituacao'] = this.usuSituacao;
    return data;
  }
}
