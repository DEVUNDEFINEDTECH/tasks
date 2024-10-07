class LoginResponse {
  String? token;
  String? message;

  LoginResponse({
    this.token,
    this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(token: json["token"], message: json["message"]);

  Map<String, dynamic> toJson() => {"token": token, "message": message};
}
