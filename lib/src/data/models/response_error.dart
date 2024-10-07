import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  dynamic data;
  String message;
  String status;

  ErrorResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
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
