class SetPasswordRequestModel {
  final String password;

  SetPasswordRequestModel({required this.password});

  Map<String, dynamic> toJson() => {
    'password': password,
  };
}