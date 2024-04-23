class UserModels {
  UserModels({
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.mobile,
    this.avatar,
    this.rol,
    this.collaborator,
    this.estado,
    this.google,
    this.apple,
    this.facebook,
    this.createdAt,
    this.updatedAt,
    this.uid,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;
  String? mobile;
  String? avatar;
  String? rol;
  String? collaborator;
  bool? estado;
  bool? google;
  bool? apple;
  bool? facebook;
  String? createdAt;
  String? updatedAt;
  String? uid;

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        countryCode: json["countryCode"],
        mobile: json["mobile"],
        avatar: json["avatar"],
        collaborator: json["collaborator"],
        rol: json["rol"],
        estado: json["estado"],
        google: json["google"],
        apple: json["apple"],
        facebook: json["facebook"],
        createdAt: (json["createdAt"]),
        updatedAt: (json["updatedAt"]),
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "countryCode": countryCode,
        "mobile": mobile,
        "avatar": avatar,
        "rol": rol,
        "collaborator": collaborator,
        "estado": estado,
        "google": google,
        "apple": apple,
        "facebook": facebook,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "uid": uid,
      };

  @override
  String toString() {
    return 'UserModels{id: $uid,collaborator: $collaborator,email: $email, mobile: $mobile, lastName: $lastName, firstName: $firstName, countryCode: $countryCode, avatar: $avatar, rol: $rol,}';
  }

  factory UserModels.init() {
    return UserModels(
      uid: 'No id',
      firstName: 'No name',
      lastName: 'No lastName',
      email: 'No email',
      collaborator: 'no collaborator',
      countryCode: 'No countryCode',
      mobile: 'No mobile',
      avatar: 'No avatar',
      estado: false,
      google: false,
      apple: false,
      facebook: false,
      createdAt: 'DateTime.now()',
      updatedAt: 'DateTime.now()',
    );
  }

  factory UserModels.fromJsonNoData() => UserModels(
        uid: "",
        email: "",
        mobile: "",
        lastName: "",
        firstName: "",
        countryCode: "",
      );

  UserModels copyWith({
    String? uid,
    String? email,
    String? mobile,
    String? username,
    String? lastName,
    String? firstName,
    String? currentStore,
    bool? smsVerified,
    String? countryCode,
  }) {
    return UserModels(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
