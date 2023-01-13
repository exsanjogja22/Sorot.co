class SuratIzin {
  bool? status;
  String? pesan;

  SuratIzin({this.status, this.pesan});

  SuratIzin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    pesan = json['pesan'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['pesan'] = pesan;
    return data;
  }
}
