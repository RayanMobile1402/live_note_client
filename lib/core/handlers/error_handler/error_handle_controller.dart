import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_nice_ui/flutter_nice_ui.dart';

import '../../../shared/models/error_action.dart';
import '../../utils/utils.dart';
import 'error_handler_view_model.dart';
import 'error_type_constants.dart';

class ErrorHandlerController {
  void showErrorHandel({
    required final ErrorHandlerViewModel error,
    required final BuildContext context,
  }) {
    final List<String> messages = [];

    if (error.errors!.isNotEmpty) {
      messages.addAll(error.errors ?? []);
    } else {
      messages.add(error.message ?? '');
    }
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (c, t, y) => const SizedBox.shrink(),
      transitionBuilder: (ctx, a1, a2, child) {
        final curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: AlertDialog(
            titlePadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Utils.getBaseTheme(context).warningColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  NiceText.bodyLarge(
                    'Warning',
                    // color: Colors.black,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Utils.getBaseTheme(context).warningColor,
                        ),
                  ),
                ],
              ),
            ),
            content: Builder(
              builder: (final context) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...messages.map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Icon(
                                Icons.circle,
                                size: 12,
                                color: Utils.getBaseTheme(context).warningColor,
                              ),
                            ),
                            Utils.mediumHorizontalSpacer,
                            Expanded(
                              child: NiceText(
                                e,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).toList(),
                    Utils.mediumHorizontalSpacer,

                    NiceText(
                      'status code : ${error.statusCode}',
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  NiceButton.flat(
                    text: 'OK',
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Utils.getBaseTheme(context).black,
                            ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  ErrorHandlerViewModel parseDioError(final dio.Response response) {
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
    if (response.statusCode == 302) {
      errorViewModel.statusCode = response.statusCode.toString();
      errorViewModel.actionError = ErrorAction.doNothing;

      return errorViewModel;
    } else if (response.statusCode == 400) {
      errorViewModel.statusCode = response.statusCode.toString();
      errorViewModel.actionError = ErrorAction.showDialog;
      errorViewModel.message = msg ?? HTTP_400_ERROR_MESSAGE;

      return errorViewModel;
    } else if (response.statusCode == 401) {
      errorViewModel.statusCode = '401';
      errorViewModel.actionError = ErrorAction.showDialog;
      errorViewModel.message = msg ?? HTTP_401_ERROR_CODE;

      return errorViewModel;
    } else if (response.statusCode! >= 402 && response.statusCode! < 500) {
      errorViewModel.statusCode = response.statusCode.toString();
      errorViewModel.actionError = ErrorAction.showDialog;
      errorViewModel.message = msg ?? HTTP_400_SERIES_ERROR_MESSAGE;

      return errorViewModel;
    } else if (response.statusCode! >= 500) {
      errorViewModel.statusCode = response.statusCode.toString();
      errorViewModel.actionError = ErrorAction.showDialog;
      errorViewModel.message = msg ?? HTTP_500_SERIES_ERROR_CODE;

      return errorViewModel;
    } else {
      errorViewModel.statusCode = response.statusCode.toString();
      errorViewModel.actionError = ErrorAction.showDialog;
      errorViewModel.message = msg ?? HTTP_UNKNOWN_ERROR_MESSAGE;

      return errorViewModel;
    }
  }
}
