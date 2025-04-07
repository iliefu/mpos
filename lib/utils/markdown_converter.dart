import 'package:markdown/markdown.dart' as md;
import 'markdown_styles.dart';

String markdownToHtml(String markdown, {MarkdownStyle style = MarkdownStyle.standard}) {
  // 转换Markdown为HTML
  final htmlContent = md.markdownToHtml(
    markdown,
    extensionSet: md.ExtensionSet.gitHubWeb,
  );

  return '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body style="${_styleToString(style.bodyStyles)}">
  ${_applyTagStyles(htmlContent, style.tagStyles)}
</body>
</html>
''';
}

String _styleToString(Map<String, String> styles) {
  return styles.entries.map((e) => '${e.key}:${e.value}').join(';');
}

String _applyTagStyles(String html, Map<String, Map<String, String>> tagStyles) {
  var result = html;
  
  // 为每种标签添加样式
  tagStyles.forEach((tag, styles) {
    final styleStr = _styleToString(styles);
    
    // 处理自闭合标签
    if (tag == 'img') {
      result = result.replaceAll('<$tag', '<$tag style="$styleStr"');
    } else {
      // 处理有开始和结束标签的元素
      final regex = RegExp('<$tag(?![a-zA-Z])([^>]*)>', caseSensitive: false);
      result = result.replaceAllMapped(regex, (match) {
        final attrs = match.group(1) ?? '';
        return '<$tag$attrs style="$styleStr">';
      });
    }
  });
  
  return result;
}