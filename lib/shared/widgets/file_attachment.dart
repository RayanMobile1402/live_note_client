import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_nice_ui/flutter_nice_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_compress/video_compress.dart';

import '../../core/extensions/list_extensions.dart';
import '../../core/utils/compressor.dart';
import '../../core/utils/utils.dart';
import '../models/file_model.dart';
import 'audio_recorder_widget.dart';
import 'circular_percent_indicator.dart';
import 'file_widget.dart';

class FileAttachment extends StatefulWidget {
  const FileAttachment({super.key});

  @override
  State<FileAttachment> createState() => _FileAttachmentState();
}

class _FileAttachmentState extends State<FileAttachment> {
  final List<FileModel> files = [];
  Map<String, dynamic>? file = {};
  late io.File compressedFile;
  late Compressor compressor;

  ContentMode contentMode = ContentMode.MainOptions;
  late bool isPhoto;
  late Subscription subscription;
  double compressProgress = 0;

  @override
  void initState() {
    subscription = VideoCompress.compressProgress$.subscribe((event) {
      setState(() {
        compressProgress = event;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () async {
          final result = await showDialog<FileModel?>(
            context: context,
            builder: (final context) => StatefulBuilder(
              builder: (final context, final setState) => AlertDialog(
                content: contentMode == ContentMode.MainOptions
                    ? mainOptions(setState)
                    : contentMode == ContentMode.FromWhere
                        ? fromWhere(isPhoto)
                        : contentMode == ContentMode.VoiceRecorder
                            ? const AudioRecorderWidget()
                            : Container(),
              ),
            ),
          );

          if (result != null) {
            files.add(
              FileModel(
                path: result.path,
                fileInfo: result.fileInfo,
              ),
            );
            setState(() {});
          }
        },
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 100,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: Utils.normalRadius,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: files.isNotEmpty
                ? Wrap(
                    children: [
                      ...files
                          .mapIndexed(
                            (item, index) => Padding(
                              padding: const EdgeInsets.all(8),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  FileWidget(
                                    FileModel(
                                      fullPath: item.path,
                                      fileInfo: item.fileInfo,
                                    ),
                                  ),
                                  Positioned(
                                    right: -10,
                                    bottom: -10,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      iconSize: 25,
                                      onPressed: () {
                                        files.removeAt(index);
                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.delete),
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      _upload(),
                    ],
                  )
                : _upload(),
          ),
        ),
      );

  Widget _upload() => Container(
        padding: Utils.mediumPadding,
        height: 90,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.upload),
            NiceText(
              'Upload a file',
            ),
          ],
        ),
      );

  Widget fromWhere(bool isPhoto) => compressProgress == 0
      ? Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () async {
                  isPhoto
                      ? file!['path'] = await Utils.pickImage()
                      : file!['path'] = await Utils.pickVideo();
                  isPhoto ? file!['type'] = 100 : file!['type'] = 102;

                  compressor = Compressor(file!['path']);
                  compressedFile = await compressor.compress();
                  file!['path'] = compressedFile.path;

                  Navigator.of(context, rootNavigator: true).pop(
                    FileModel(
                      path: file!['path'],
                      fileInfo: FileInfo(
                        type: file!['type'],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/images/gallery.svg',
                          width: 25,
                          height: 25,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'From Gallery',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  isPhoto
                      ? file!['path'] = await Utils.pickImage()
                      : file!['path'] = await Utils.pickVideo();
                  isPhoto ? file!['type'] = 100 : file!['type'] = 102;
                  compressor = Compressor(file!['path']);
                  compressedFile = await compressor.compress();
                  file!['path'] = compressedFile.path;
                  Navigator.of(context).pop(
                    FileModel(
                      path: file!['path'],
                      fileInfo: FileInfo(
                        type: file!['type'],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/images/camera.svg',
                          width: 25,
                          height: 25,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'From Camera',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      : Container(
          width: 100,
          padding: const EdgeInsets.all(10),
          child: CircularPercentIndicator(
            radius: 40,
            lineWidth: 6,
            animation: true,
            animateFromLastPercent: true,
            center: Text(
              '${compressProgress.floor()} %',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            footer: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Compressing Video...',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            percent: compressProgress / 100,
            progressColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
        );

  Widget mainOptions(
    final void Function(void Function() s) setState,
  ) =>
      SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isPhoto = true;
                  contentMode = ContentMode.FromWhere;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/images/image.svg',
                        width: 25,
                        height: 25,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Photo',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isPhoto = false;
                  contentMode = ContentMode.FromWhere;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/images/video.svg',
                        width: 25,
                        height: 25,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Video',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  contentMode = ContentMode.VoiceRecorder;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/images/voice.svg',
                        width: 25,
                        height: 25,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Voice',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                file!['path'] = await Utils.pickFile();
                if (file!['path'].toString().endsWith('pdf')) {
                  file!['type'] = 104;
                } else {
                  file!['type'] = 103;
                }
                Navigator.of(context).pop(
                  FileModel(
                    path: file!['path'],
                    fileInfo: FileInfo(
                      type: file!['type'],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/images/folder.svg',
                        width: 25,
                        height: 25,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'File',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

enum ContentMode { MainOptions, FromWhere, VoiceRecorder }

enum OutPutType { MAP, PATHONLY }
