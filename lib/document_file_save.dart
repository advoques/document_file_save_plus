
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class DocumentFileSave {
  static const MethodChannel _channel =
      const MethodChannel('document_file_save');

   static Future<String?> get platformVersion async {
    return await _channel.invokeMethod('getPlatformVersion');
  }

  static Future<int?> get batteryPercentage async {
    return await _channel.invokeMethod('getBatteryPercentage');
  }

  static Future<void> saveMultipleFiles(List<Uint8List>? dataList, List<String> fileNameList, List<String> mimeTypeList) async {
    if (dataList!.length != fileNameList.length)
      throw "function saveMultipleFiles: length of 'dataList' is not equal to the length of 'fileNameList'";

    if (dataList.length != mimeTypeList.length)
      throw "function saveMultipleFiles: length of 'dataList' is not equal to the length of 'mimeTypeList'";

    for (var i = 0; i < dataList.length; i++) {
      if (dataList[i].isEmpty)
        throw "function saveMultipleFiles: dataList item cannot be null";
    }

    for (var i = 0; i < mimeTypeList.length; i++) {
      if (mimeTypeList[i].isEmpty)
        throw "function saveMultipleFiles: mimeTypeList item cannot be null";
    }

    var fileNameCount = new Map();
    for (var i = 0; i < fileNameList.length; i++) {
      String? fileName = fileNameList[i];

      if (fileName.length == 0)
        fileName = "file";

      if (fileNameCount.containsKey(fileName)) {
        fileNameCount[fileName] += 1;
        var extensionIndex = fileName.lastIndexOf('.');
        if (extensionIndex == -1)
          extensionIndex = fileName.length;

        var extension = '';
        if (extensionIndex < fileName.length)
          extension = fileName.substring(extensionIndex);

        fileName = fileName.substring(0, extensionIndex) + '_' + fileNameCount[fileName].toString() + extension;
      } else {
        fileNameCount[fileName] = 1;
      }

      fileNameList[i] = fileName;
    }

    try {
      await _channel.invokeMethod('saveMultipleFiles', {
        "dataList": dataList,
        "fileNameList": fileNameList,
        "mimeTypeList": mimeTypeList
      });
    } on PlatformException {
      rethrow;
    }
  }

  static Future<void> saveFile(Uint8List data, String fileName, String mimeType) async {
    await saveMultipleFiles([data], [fileName], [mimeType]);
  }
}
