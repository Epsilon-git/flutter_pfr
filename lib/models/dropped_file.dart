class DroppedFile {
  final String fileName;
  final String mime;
  final int bytes;
  final String url;

  DroppedFile({
    required this.fileName,
    required this.mime,
    required this.bytes,
    required this.url,
  });

  String get size {
    final kb = bytes / 1024;
    final mb = kb / 1024;

    return mb > 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
  }
}
