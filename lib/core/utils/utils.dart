import 'package:bot_toast/bot_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/widgets/downloader.dart';
import '../parameters/local_storage_key.dart';
import '../theme/base_theme.dart';
import '../theme/controller/theme_controller.dart';

enum FileFormat {
  audio,
  video,
  networkImage,
  file,
  pdf,
  memoryImage,
  memoryVoice,
  memoryVideo,
  memoryFile,
  memoryPdf
}

class Utils {
  static String? getFileType(final int type) {
    switch (type) {
      case 0:
        return 'unknown';
      case 1:
        return 'doc';
      case 2:
        return 'docx';
      case 3:
        return 'xls';
      case 4:
        return 'xlsx';
      case 5:
        return 'pdf';
      case 6:
        return 'jpg';
      case 7:
        return 'jpeg';
      case 8:
        return 'png';
      case 9:
        return 'bmp';
      case 10:
        return 'gif';
      case 11:
        return 'zip';
      case 12:
        return 'mp4';
      case 13:
        return 'wmv';
      case 14:
        return 'avi';
      case 15:
        return 'mov';
      case 16:
        return 'mp3';
      case 17:
        return 'aac';
      case 18:
        return 'm4a';
      case 19:
        return 'wav';
    }
    return null;
  }

  static const double smallWidth = 576;
  static const double mediumWidth = 768;
  static const double largeWidth = 992;
  static const double extraLargeWidth = 1200;

  static const double smallSize = 15;
  static const double mediumSize = 20;
  static const double largeSize = 30;
  static const double tinySpace = 2;
  static const double smallSpace = 4;
  static const double mediumSpace = 8;
  static const double semiLargeSpace = 12;
  static const double largeSpace = 16;
  static const double giantSpace = 32;
  static const double maxCrossAxisExtent = 100;
  static const double smallMaxCrossAxisExtent = 80;
  static const double maxWith = 700;
  static const tinyVerticalSpacer = SizedBox(height: Utils.tinySpace);
  static const smallVerticalSpacer = SizedBox(height: Utils.smallSpace);
  static const mediumVerticalSpacer = SizedBox(height: Utils.mediumSpace);
  static const largeVerticalSpacer = SizedBox(height: Utils.largeSpace);
  static const giantVerticalSpacer = SizedBox(height: Utils.giantSpace);

  static const tinyHorizontalSpacer = SizedBox(width: Utils.tinySpace);
  static const smallHorizontalSpacer = SizedBox(width: Utils.smallSpace);
  static const mediumHorizontalSpacer = SizedBox(width: Utils.mediumSpace);
  static const largeHorizontalSpacer = SizedBox(width: Utils.largeSpace);
  static const giantHorizontalSpacer = SizedBox(width: Utils.giantSpace);

  static const mediumPadding = EdgeInsetsDirectional.all(mediumSpace);
  static const smallPadding = EdgeInsetsDirectional.all(smallSpace);
  static const tinyPadding = EdgeInsetsDirectional.all(tinySpace);
  static const largePadding = EdgeInsetsDirectional.all(largeSpace);
  static const giantPadding = EdgeInsetsDirectional.all(giantSpace);

  static const normalRadius = BorderRadius.all(
    Radius.circular(mediumSpace),
  );

  static Future<String?> pickFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      debugPrint('pickFile : ${result.files.single.path}');
      return result.files.single.path;
    } else {
      debugPrint('No file selected.');
      return null;
    }
  }

  static Widget loading({Color? color}) =>
      LoadingAnimationWidget.staggeredDotsWave(
        size: 27,
        color: color ?? Colors.white,
      );

  static Future<bool> userHasPinCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? hasPinCode;
    if (prefs.getString(LocalStorageKey.apiToken) != null &&
        prefs.getString(LocalStorageKey.apiToken) != '') {
      final String? token = prefs.getString(LocalStorageKey.apiToken);

      final Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
      hasPinCode = decodedToken['hasPinCode'];
    }

    if (hasPinCode != null && hasPinCode.toLowerCase() == 'true') {
      return true;
    } else {
      final bool? pinLogin = prefs.getBool(LocalStorageKey.pinLogin);

      return pinLogin != null && pinLogin;
    }
  }

  static Future<String?> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      debugPrint('pickImage : ${pickedFile.path}');

      return pickedFile.path;
    } else {
      debugPrint('No file selected.');

      return null;
    }
  }

  static Future<String?> pickVideo() async {
    final file = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (file == null) return null;
    return file.files.first.path;
  }

  static int? setFileType(final String filePath) {
    final path = filePath.toLowerCase();
    final startPoint = path.lastIndexOf('.');
    final String suffix = path.substring(startPoint);
    if (suffix == '.doc') {
      return 1;
    } else if (suffix == '.docx') {
      return 2;
    } else if (suffix == '.xls') {
      return 3;
    } else if (suffix == '.xlsx') {
      return 4;
    } else if (suffix == '.pdf') {
      return 5;
    } else if (suffix == '.jpg') {
      return 6;
    } else if (suffix == '.jpeg') {
      return 7;
    } else if (suffix == '.png') {
      return 8;
    } else if (suffix == '.bmp') {
      return 9;
    } else if (suffix == '.gif') {
      return 10;
    } else if (suffix == '.zip') {
      return 11;
    } else if (suffix == '.mp4') {
      return 12;
    } else if (suffix == '.wmv') {
      return 13;
    } else if (suffix == '.avi') {
      return 14;
    } else if (suffix == '.mov') {
      return 15;
    } else if (suffix == '.mp3') {
      return 16;
    } else if (suffix == '.aac') {
      return 17;
    } else if (suffix == '.m4a') {
      return 18;
    } else if (suffix == '.wav') {
      return 19;
    }

    return null;
  }

  static FileFormat getFileFormat(final int? type) {
    switch (type) {
      case 5:
        return FileFormat.pdf;

      case 6:
        return FileFormat.networkImage;
      case 7:
        return FileFormat.networkImage;
      case 8:
        return FileFormat.networkImage;
      case 9:
        return FileFormat.networkImage;
      case 10:
        return FileFormat.networkImage;

      case 0:
        return FileFormat.video;
      case 12:
        return FileFormat.video;
      case 13:
        return FileFormat.video;
      case 14:
        return FileFormat.video;
      case 15:
        return FileFormat.video;

      case 16:
        return FileFormat.audio;
      case 17:
        return FileFormat.audio;
      case 18:
        return FileFormat.audio;
      case 19:
        return FileFormat.audio;
      case 100:
        return FileFormat.memoryImage;
      case 101:
        return FileFormat.memoryVoice;
      case 102:
        return FileFormat.memoryVideo;
      case 103:
        return FileFormat.memoryFile;
      case 104:
        return FileFormat.memoryPdf;

      default:
        return FileFormat.file;
    }
  }

  static void downloader(
    final BuildContext context,
    final String url,
    final Map<String, String> header,
    final String type,
  ) {
    showDialog<void>(
      context: context,
      builder: (final context) => Downloader(
        url: url,
        type: type,
        header: header,
      ),
    );
  }

  static BaseTheme getBaseTheme(BuildContext context) =>
      Get.find<ThemeController>().baseTheme.value!;

  static void toast(
      {required final String msg, required BuildContext context}) {
    BotToast.showText(
      text: msg,
      align: Alignment.center,
      duration: const Duration(seconds: 2),
      onlyOne: true,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      contentPadding: const EdgeInsets.all(10),
      contentColor: Utils.getBaseTheme(context).primarySwatch,
      crossPage: true,
      textStyle:
          TextStyle(color: Utils.getBaseTheme(context).scaffoldBackgroundColor.value),
    );
  }

  static DateTime? serverDateFormatToDate(final String? date) {
    final DateFormat format = DateFormat("yyyy-MM-dd'T'HH:mm:ss", 'en_US');
    if (date == null) {
      return null;
    }

    return format.parse(date);
  }

  static String getSimpleDateFormat(final DateTime dateTime) =>
      DateFormat('dd/MM/yyyy', 'en_US').format(
        dateTime,
      );

  static String? getCompleteDateFormat(final DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }

    return DateFormat("yyyy-MM-dd'T'HH:mm:ss", 'en_US').format(dateTime);
  }

  static String getDateTimeFormat(final DateTime dateTime) =>
      DateFormat('dd/MM/yyyy  HH:mm', 'en_US').format(dateTime);

  static String getDayDateTimeFormat(final DateTime dateTime) =>
      DateFormat('EEEE dd/MM/yyyy  HH:mm', 'en_US').format(dateTime);

  static String getDayShortDateTimeFormat(final DateTime dateTime) =>
      DateFormat('E dd/MM/yyyy  ', 'en_US').format(dateTime.toLocal());

  static String getTimeFormat(final DateTime dateTime) =>
      DateFormat('HH:mm', 'en_US').format(dateTime);

  static int dateTimeToSecond(final DateTime dateTime) {
    final int ms = dateTime.millisecondsSinceEpoch;

    return (ms / 1000).round();
  }

  static DateTime setZeroToTime(final DateTime timeOfDay) => DateTime.utc(
        timeOfDay.year,
        timeOfDay.month,
        timeOfDay.day,
        0,
        0,
        0,
        0,
        0,
      );

  static DateTime getStartTimeOfDay(final DateTime date) => fromDateTime(
        date,
        hour: 0,
        minute: 0,
        second: 0,
      );

  static DateTime getEndTimeOfDay(final DateTime date) => fromDateTime(
        date,
        hour: 23,
        minute: 59,
        second: 59,
      );

  static DateTime fromDateTime(
    final DateTime src, {
    final int? year,
    final int? month,
    final int? day,
    final int? hour,
    final int? minute,
    final int? second,
    final int? millisecond,
  }) =>
      DateTime(
        year ?? src.year,
        month ?? src.month,
        day ?? src.day,
        hour ?? src.hour,
        minute ?? src.minute,
        second ?? src.second,
        millisecond ?? src.millisecond,
      );

  static bool isDateInToday(final DateTime date) =>
      date.millisecondsSinceEpoch >= DateTime.now().millisecondsSinceEpoch &&
      date.millisecondsSinceEpoch <= DateTime.now().millisecondsSinceEpoch;

  // date.isBefore(getEndTimeOfDay(DateTime.now())) &&
  // date.isAfter(
  //   getStartTimeOfDay(
  //     DateTime.now(),
  //   ),
  // );

  static String toUtc(final DateTime date) =>
      '${date.toIso8601String()}${date.isUtc ? '' : 'Z'}';

  static String getDateOfService({
    required final String from,
    required final String until,
  }) =>
      '${Utils.getDayShortDateTimeFormat(
        Utils.serverDateFormatToDate(from)!,
      )} ${Utils.getTimeFormat(Utils.serverDateFormatToDate(from)!)} - '
      '${Utils.serverDateFormatToDate(until)!.hour.toString().padLeft(2, '0')} :'
      '${Utils.serverDateFormatToDate(until)!.minute.toString().padLeft(2, '0')}';
}
