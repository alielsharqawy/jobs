class AppFunctions {
  // Remove HTML tags and decode HTML entities (original function)
  String cleanHtmlText(String htmlText) {
    return htmlText
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  // Advanced HTML cleaning with structure preservation
  String cleanHtmlTextWithStructure(String htmlText, {
    bool preserveParagraphs = true,
    bool preserveLists = true,
    bool preserveLineBreaks = true,
    bool convertListItems = true,
    String listItemPrefix = '• ',
  }) {
    String processedText = htmlText;

    // Step 1: Convert structural HTML to plain text while preserving meaning
    if (preserveParagraphs) {
      processedText = processedText
          .replaceAll('<p>', '\n')
          .replaceAll('</p>', '\n');
    }

    if (preserveLists) {
      processedText = processedText
          .replaceAll('<ul>', '\n')
          .replaceAll('</ul>', '\n')
          .replaceAll('<ol>', '\n')
          .replaceAll('</ol>', '\n');
    }

    if (convertListItems) {
      processedText = processedText
          .replaceAll('<li>', listItemPrefix)
          .replaceAll('</li>', '\n');
    }

    if (preserveLineBreaks) {
      processedText = processedText
          .replaceAll('<br>', '\n')
          .replaceAll('<br/>', '\n')
          .replaceAll('<br />', '\n');
    }

    // Step 2: Remove remaining HTML tags
    processedText = processedText
        .replaceAll('<strong>', '')
        .replaceAll('</strong>', '')
        .replaceAll('<b>', '')
        .replaceAll('</b>', '')
        .replaceAll('<em>', '')
        .replaceAll('</em>', '')
        .replaceAll('<i>', '')
        .replaceAll('</i>', '')
        .replaceAll(RegExp(r'<[^>]*>'), '');

    // Step 3: Clean HTML entities
    processedText = processedText
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll(RegExp(r'&[^;]+;'), ' ');

    // Step 4: Normalize line breaks and spaces
    processedText = processedText
        .replaceAll('\r\n', '\n')
        .replaceAll('\r', '\n')
        .replaceAll(RegExp(r'\n\s*\n'), '\n') // Remove empty lines
        .replaceAll(RegExp(r'[ \t]+'), ' ') // Normalize spaces
        .trim();

    return processedText;
  }

  // Simple version for basic cleaning (backward compatibility)
  String cleanHtmlTextSimple(String htmlText) {
    return cleanHtmlText(htmlText);
  }
}
