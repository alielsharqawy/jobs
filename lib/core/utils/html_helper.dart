import 'package:html/parser.dart' as html_parser;

class HtmlHelper {
  /// Converts HTML text to plain text by removing all HTML tags
  static String htmlToPlainText(String htmlText) {
    if (htmlText.isEmpty) return htmlText;
    
    try {
      // Parse the HTML
      var document = html_parser.parse(htmlText);
      
      // Extract plain text
      String plainText = document.body?.text ?? htmlText;
      
      // Clean up extra whitespace
      return plainText.replaceAll(RegExp(r'\s+'), ' ').trim();
    } catch (e) {
      // If parsing fails, return the original text
      return htmlText;
    }
  }
  
  /// Removes basic HTML tags using regex (lighter alternative)
  static String stripHtmlTags(String htmlText) {
    if (htmlText.isEmpty) return htmlText;
    
    return htmlText
        .replaceAll(RegExp(r'<[^>]*>'), '') // Remove HTML tags
        .replaceAll('&nbsp;', ' ') // Replace non-breaking spaces
        .replaceAll('&amp;', '&') // Replace HTML entities
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll(RegExp(r'\s+'), ' ') // Clean up extra whitespace
        .trim();
  }
}
