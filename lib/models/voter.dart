class VoterModelV5 {
  String? nama;

  VoterModelV5({this.nama});

  factory VoterModelV5.fromJson(Map<String, dynamic> json) =>
      VoterModelV5(nama: json['nama']);
}
