class KelapaUserModel {
  int? id;
  int? kilo;
  Users? users;

  KelapaUserModel({this.id, this.kilo, this.users});

  KelapaUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kilo = json['kilo'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kilo'] = kilo;
    if (users != null) {
      data['users'] = users!.toJson();
    }
    return data;
  }
}

class Users {
  int? id;
  String? nama;

  Users({this.id, this.nama});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    return data;
  }
}
