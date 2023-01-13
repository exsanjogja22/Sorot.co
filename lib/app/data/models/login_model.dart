class Login {
  bool? status;
  String? token;
  String? pesan;

  Login({this.status, this.token, this.pesan});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    pesan = json['pesan'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    data['pesan'] = pesan;
    return data;
  }
}
