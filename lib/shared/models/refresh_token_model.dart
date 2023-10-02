class RefreshTokenModel {
  final String accessToken;
  final String refreshToken;
  final int? status;
  final bool? isSuccess;
  final bool? isFailure;
  final String? message;

  RefreshTokenModel({
    required this.refreshToken,
    required this.accessToken,
    required this.status,
    required this.isSuccess,
    required this.isFailure,
    required this.message,
  });

  factory RefreshTokenModel.fromJson(final Map<String, dynamic> json) =>
      RefreshTokenModel(
        accessToken: json['data']['accessToken'],
        refreshToken: json['data']['refreshToken'],
        status: json['status'],
        isSuccess: json['isSuccess'],
        isFailure: json['isFailure'],
        message: json['message'],
      );
}
