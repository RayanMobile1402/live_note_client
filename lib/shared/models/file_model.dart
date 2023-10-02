import 'dart:io';

class FileModel {
  FileInfo? fileInfo;
  String? path;
  String? fullPath;
  String? gid;
  bool? canDelete;
  File? fileContent;

  FileModel({
    this.fileInfo,
    this.path,
    this.fullPath,
    this.gid,
    this.canDelete,
    this.fileContent,
  });

  FileModel.fromJson(final Map<String, dynamic> json) {
    fileInfo =
        json['fileInfo'] != null ? FileInfo.fromJson(json['fileInfo']) : null;
    path = json['path'];
    gid = json['gid'];
    fullPath = json['fullPath'];
    canDelete = json['canDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fileInfo != null) {
      data['fileInfo'] = fileInfo!.toJson();
    }
    data['path'] = path;
    data['gid'] = gid;
    data['fullPath'] = fullPath;
    data['canDelete'] = canDelete;

    return data;
  }
}

class FileInfo {
  String? name;
  double? size;
  int? type;

  FileInfo({
    this.name,
    this.size,
    this.type,
  });

  FileInfo.fromJson(final Map<String, dynamic> json) {
    name = json['name'];
    size = json['size'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['size'] = size;
    data['type'] = type;

    return data;
  }
}
