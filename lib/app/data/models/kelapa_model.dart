class KelapaModel {
  int? id;
  String? createdAt;
  int? idUser;
  int? kilo;

  KelapaModel({this.id, this.createdAt, this.idUser, this.kilo});

  KelapaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    idUser = json['id_user'];
    kilo = json['kilo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['id_user'] = idUser;
    data['kilo'] = kilo;
    return data;
  }
}
