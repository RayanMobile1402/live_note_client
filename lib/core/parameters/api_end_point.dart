class ApiEndPoint {
  static const String baseUrl = 'https://192.168.1.37:3002/';
  static const String identityBaseUrl = 'https://192.168.1.37:3000/';

  // ==========================>> Login <<===========================
  static const String loginUrl = '${baseUrl}app/user/login';
  static const String forgetPassword =
      '${identityBaseUrl}Account/ForgetPassword';
  static const String resetPasswordPassword =
      '${identityBaseUrl}Account/ResetPassword';
  static const String checkVersion = '${baseUrl}app/checkVersion';
  static const String getBranchesUrl = '${baseUrl}branch/list';
  static const String verifyEmailUrl = '${identityBaseUrl}Account/ConfirmEmail';
  static const String refreshTokenUrl = '${baseUrl}app/user/refreshToken';

  static String confirmEmailUrl(final String email) => '$verifyEmailUrl/$email';
}
