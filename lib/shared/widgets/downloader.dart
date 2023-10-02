import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_nice_ui/flutter_nice_ui.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/handlers/notification_handler/notification_controller.dart';
import '../../core/utils/utils.dart';

class Downloader extends StatefulWidget {
  final String url;
  final String type;
  final Map<String, String> header;

  const Downloader({
    required this.url,
    required this.header,
    required this.type,
    super.key,
  });

  @override
  _DownloaderState createState() => _DownloaderState();
}

class _DownloaderState extends State<Downloader> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  String _progress = '-';
  late String _fileName;
  final Dio _dio = Dio();
  bool dlCompleted = false;
  dynamic jsonForButton;

  Future<void> _download() async {
    final dir = await _getDownloadDirectory();
    final isPermissionStatusGranted = await _requestPermissions();
    if (isPermissionStatusGranted) {
      final savePath = path.join(dir.path, _fileName);
      await _startDownload(savePath);
    } else {
      // handle the scenario when user declines the permissions
    }
  }

  Future<void> _startDownload(final String savePath) async {
    final Map<String, dynamic> result = {
      'isSuccess': false,
      'filePath': null,
      'error': null,
    };

    _dio.options.headers = widget.header;
    try {
      final response = await _dio.download(
        widget.url,
        savePath,
        onReceiveProgress: _onReceiveProgress,
      );
      result['isSuccess'] = response.statusCode == 200;
      result['filePath'] = savePath;
    } catch (ex) {
      result['error'] = ex.toString();
    } finally {
      setState(() {
        dlCompleted = true;
      });
      await _showNotification(result);
      jsonForButton = jsonEncode(result);
    }
  }

  Future<void> _showNotification(
    final Map<String, dynamic> downloadStatus,
  ) async {
    const androidDetails = AndroidNotificationDetails(
      'channel id',
      'channel name',
      channelDescription: 'channel description',
      priority: Priority.high,
      importance: Importance.max,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentBadge: true,
      presentAlert: true,
      categoryIdentifier:
          NotificationController.darwinNotificationCategoryPlain,
    );

    const platform =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    final json = jsonEncode(downloadStatus);
    final isSuccess = downloadStatus['isSuccess'];

    await flutterLocalNotificationsPlugin.show(
      0, // notification id
      isSuccess ? 'Success' : 'Failure',
      isSuccess
          ? 'File has been downloaded successfully!'
          : 'There was an error while downloading the file.',
      platform,
      payload: json,
    );
  }

  void _onReceiveProgress(final int received, final int total) {
    if (total != -1) {
      setState(() {
        _progress = '${(received / total * 100).toStringAsFixed(0)}%';
        debugPrint(_progress);
      });
    }
  }

  Future<Directory> _getDownloadDirectory() async {
    Directory directory;
    if (Platform.isAndroid) {
      directory = Directory('/storage/emulated/0/Download/');
      debugPrint(directory.path);

      return directory;
    }

    // in this example we are using only Android and iOS so I can assume
    // that you are not trying it for other platforms and the if statement
    // for iOS is unnecessary

    // iOS directory visible to user
    directory = await getApplicationDocumentsDirectory();
    debugPrint(directory.path);
    return directory;
  }

  Future<bool> _requestPermissions() async {
    PermissionStatus status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
      status = await Permission.storage.status;
    }

    return status == PermissionStatus.granted;
  }

  @override
  void initState() {
    super.initState();

    // final String stringDate =
    //     DateFormat('yyyy-MM-dd-HH-mm-ss').format(DateTime.now());
    _fileName = '.${widget.type}';
    debugPrint(_fileName);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .initialize(NotificationController.initSetting());

    _download();
  }

  @override
  Widget build(final BuildContext context) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        elevation: 10,
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: !dlCompleted
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const NiceText(
                      'Download progress:',
                    ),
                    NiceText(
                      _progress,
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const NiceText(
                      'Download Completed',
                    ),
                    NiceButton.filled(
                      text: 'Open File',
                      onPressed: () {
                        final obj = jsonDecode(jsonForButton);

                        if (obj['isSuccess']) {
                          OpenFile.open(obj['filePath']).then((final value) {
                            if (value.type.name == 'noAppToOpen') {
                              Utils.toast(msg: value.message,context: context);
                            }
                          });
                        } else {
                          showDialog<void>(
                            context: context,
                            builder: (final _) => AlertDialog(
                              title: const Text('Error'),
                              content: Text('${obj['error']}'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
        ),
      );
}
