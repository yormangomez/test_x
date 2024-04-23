class RefreshModel {
  RefreshModel({
    required this.refresh,
    required this.access,
    required this.accessTokenExpiration,
  });

  final String refresh;
  final String access;
  final String accessTokenExpiration;

  factory RefreshModel.fromJson(Map<String, dynamic> json) => RefreshModel(
    refresh: json["refresh"],
    access: json["access"],
    accessTokenExpiration: json["access_token_expiration"],
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
    "access_token_expiration": accessTokenExpiration,
  };
}