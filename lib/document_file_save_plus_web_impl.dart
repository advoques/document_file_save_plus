import 'dart:typed_data';
import 'package:document_file_save_plus/document_file_save_plus_platform_interface.dart';
import 'package:web/web.dart';

typedef DocumentFileSavePlusPlatformImpl = DocumentFileSavePlusWeb;

class DocumentFileSavePlusWeb extends DocumentFileSavePlusPlatform {
  @override
  Future<String?> get platformVersion async => throw UnimplementedError('platformVersion() has not been implemented on web.');

  @override
  Future<int?> get batteryPercentage async => throw UnimplementedError('batteryPercentage() has not been implemented on web.');

  @override
  Future<void> saveMultipleFiles({
    List<Uint8List>? dataList,
    required List<String> fileNameList,
    required List<String> mimeTypeList,
  }) async {
    if (dataList!.length != 1)
      throw "web implementation only supports saving a single file";

    final filename = fileNameList.first;
    final url = Uri.dataFromBytes(dataList.first, mimeType: mimeTypeList.first).toString();

    HTMLAnchorElement()
      ..href = url
      ..download = filename
      ..click();
  }
}