class UserModel {
  int? id;
  String? createdAt;
  String? nama;
  String? bidang;
  int? totalKilo;
  int? gaji;
  String? gudang;

  UserModel(
      {this.id,
      this.createdAt,
      this.nama,
      this.bidang,
      this.totalKilo,
      this.gaji,
      this.gudang});

  // Memasukan data dari respon ke model
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    nama = json['nama'];
    bidang = json['bidang'];
    totalKilo = json['total_kilo'];
    gaji = json['gaji'];
    gudang = json['gudang'];
  }

  // untuk mengirim data
}
