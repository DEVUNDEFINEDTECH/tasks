import 'dart:convert';

SuccessResponse successResponseFromJson(String str) =>
    SuccessResponse.fromJson(json.decode(str));

String successResponseToJson(SuccessResponse data) =>
    json.encode(data.toJson());

class SuccessResponse {
  dynamic data;
  String? message;
  String status;

  SuccessResponse({
    this.data,
    this.message,
    required this.status,
  });

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      SuccessResponse(
        data: json["data"],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "status": status,
      };
}
