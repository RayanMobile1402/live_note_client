import 'package:dio/dio.dart';

import '../../../shared/models/error_action.dart';

class ErrorHandlerViewModel {
  int? status;
  String? statusCode;
  bool? isSuccess;
  String? message;
  ErrorAction? actionError;
  List<String>? errors;
  dynamic data;

  ErrorHandlerViewModel({
    this.status,
    this.isSuccess,
    this.message,
    this.errors,
    this.statusCode,
    this.actionError=ErrorAction.showDialog,
  });

  ErrorHandlerViewModel.fromJson(final Map<String, dynamic> json) {
    status = json['status'] ?? false;
    isSuccess = json['isSuccess'] ?? false;
    message = json['message'] ?? '';
    data = json['data'];
    errors = json['messages'] == null ? [] : json['messages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['isSuccess'] = isSuccess;
    data['status'] = status;
    data['errors'] = errors ?? [];
    data['messages'] = message;
    return data;
  }

  static ErrorHandlerViewModel parseDioError(final Response response) {
    String? msg;
    List<String>? errors;
    ErrorHandlerViewModel errorViewModel = ErrorHandlerViewModel();

    if (response.data is Map) {
      errorViewModel = ErrorHandlerViewModel.fromJson(response.data);
    }

    try {
      errors = [errorViewModel.message!] + errorViewModel.errors!;
    } catch (e) {}

    if (errors != null) {
      msg = errors.join('\n');
    }
    response.statusCode = response.statusCode ?? 400;
    if (response.statusCode == 302) {
      errorViewModel.statusCode = response.statusCode.toString();

      return errorViewModel;
    } else if (response.statusCode == 400) {
      errorViewModel.statusCode = response.statusCode.toString();
      errorViewModel.message = msg ?? "HTTP_400_ERROR_MESSAGE";

      return errorViewModel;
    } else if (response.statusCode == 401) {
      errorViewModel.statusCode = '401';
      errorViewModel.message = msg ?? "HTTP_401_ERROR_CODE";

      return errorViewModel;
    } else if (response.statusCode! >= 402 && response.statusCode! < 500) {
      errorViewModel.statusCode = response.statusCode.toString();
      errorViewModel.message = msg ?? "HTTP_400_SERIES_ERROR_MESSAGE";

      return errorViewModel;
    } else if (response.statusCode! >= 500) {
      errorViewModel.statusCode = response.statusCode.toString();
      errorViewModel.message = msg ?? "HTTP_500_SERIES_ERROR_CODE";

      return errorViewModel;
    } else {
      errorViewModel.statusCode = response.statusCode.toString();
      errorViewModel.message = msg ?? "HTTP_UNKNOWN_ERROR_MESSAGE";

      return errorViewModel;
    }
  }
}
