extension StringExtension on String {
  String stripHtml() => replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
}
