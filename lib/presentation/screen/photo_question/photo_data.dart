import 'dart:io';

abstract class PhotoData {
}

class FromAsset extends PhotoData {
  final String url;

  FromAsset({required this.url});
}

class FromFile extends PhotoData {
  final File file;

  FromFile({required this.file});
}