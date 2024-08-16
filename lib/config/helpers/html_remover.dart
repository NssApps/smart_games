

class HtmlRemover {

  static String removeHtmlTags(String htmlString) {
    // Using a regular expression to match and remove HTML tags
    final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

}