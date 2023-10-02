import '../../shared/models/branch_view_model.dart';
import '../theme/theme_type.dart';

class Parameters {
  static BranchViewModel currentBranch = BranchViewModel();
  static List<String> roles = [];
  static String? accessToken;
  static String? refreshToken;
  static bool canCheckBiometric = false;
  static bool biometricLogin = false;
  static bool rememberMe = false;
  static DateTime? accessTokenExpirationDateTime;
  static const int timeoutTime = 10;


  static ThemeType themeType = ThemeType.light;


  static Map<String, String> getHeader() {
    if (accessToken?.isNotEmpty ?? false) {
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'TenantId': '${currentBranch.value}',
      };
    }

    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  }
}
