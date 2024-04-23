class UserModel {
  UserModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.surName,
    this.rol,
    this.email,
    this.avatar,
  });

  String? id;
  String? name;
  String? phoneNumber;
  String? surName;
  String? rol;
  String? email;
  String? avatar;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        surName: json["surName"],
        email: json["email"],
        avatar: json["avatar"],
        rol: json["rol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phoneNumer": phoneNumber,
        "surName": surName,
        "email": email,
        "avatar": avatar,
        "rol": rol,
      };
}
