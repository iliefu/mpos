
class MarkdownStyle {
  final String name;
  final Map<String, String> bodyStyles;
  final Map<String, Map<String, String>> tagStyles;

  const MarkdownStyle({
    required this.name,
    required this.bodyStyles,
    required this.tagStyles,
  });

  // 标准样式
  static const standard = MarkdownStyle(
    name: '标准',
    bodyStyles: {
      'font-family': "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif",
      'line-height': "1.8",
      'font-size': "16px",
      'color': "#333333",
      'padding': "16px",
    },
    tagStyles: {
      'h1': {'font-size': '24px', 'margin': '24px 0 16px', 'font-weight': '600'},
      'h2': {'font-size': '22px', 'margin': '22px 0 14px', 'font-weight': '600'},
      'h3': {'font-size': '20px', 'margin': '20px 0 12px', 'font-weight': '600'},
      'p': {'margin': '16px 0', 'line-height': '1.8'},
      'img': {'max-width': '100%', 'height': 'auto', 'margin': '16px 0'},
      'pre': {'background-color': '#f6f8fa', 'padding': '16px', 'border-radius': '6px', 'overflow': 'auto'},
      'code': {'font-family': 'SFMono-Regular, Consolas, Liberation Mono, Menlo, monospace', 'background-color': 'rgba(175,184,193,0.2)', 'padding': '0.2em 0.4em', 'border-radius': '3px'},
      'blockquote': {'border-left': '4px solid #dfe2e5', 'padding-left': '16px', 'color': '#6a737d', 'margin': '16px 0'},
      'ul': {'padding-left': '32px'},
      'ol': {'padding-left': '32px'},
      'li': {'margin': '8px 0'},
      'a': {'color': '#0366d6', 'text-decoration': 'none'},
    },
  );

  // 紧凑样式
  static const compact = MarkdownStyle(
    name: '紧凑',
    bodyStyles: {
      'font-family': "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif",
      'line-height': "1.5",
      'font-size': "14px",
      'color': "#444444",
      'padding': "12px",
    },
    tagStyles: {
      'h1': {'font-size': '20px', 'margin': '16px 0 12px', 'font-weight': '600'},
      'h2': {'font-size': '18px', 'margin': '14px 0 10px', 'font-weight': '600'},
      'h3': {'font-size': '16px', 'margin': '12px 0 8px', 'font-weight': '600'},
      'p': {'margin': '12px 0', 'line-height': '1.5'},
      'img': {'max-width': '100%', 'height': 'auto', 'margin': '12px 0'},
      'pre': {'background-color': '#f6f8fa', 'padding': '12px', 'border-radius': '4px', 'overflow': 'auto'},
      'code': {'font-family': 'SFMono-Regular, Consolas, Liberation Mono, Menlo, monospace', 'background-color': 'rgba(175,184,193,0.2)', 'padding': '0.1em 0.2em', 'border-radius': '2px'},
      'blockquote': {'border-left': '3px solid #dfe2e5', 'padding-left': '12px', 'color': '#6a737d', 'margin': '12px 0'},
      'ul': {'padding-left': '24px'},
      'ol': {'padding-left': '24px'},
      'li': {'margin': '4px 0'},
      'a': {'color': '#0366d6', 'text-decoration': 'none'},
    },
  );

  // 优雅样式
  static const elegant = MarkdownStyle(
    name: '优雅',
    bodyStyles: {
      'font-family': "'Noto Sans', 'PingFang SC', 'Microsoft YaHei', sans-serif",
      'line-height': "1.8",
      'font-size': "16px",
      'color': "#333333",
      'padding': "24px",
      'max-width': "800px",
      'margin': "0 auto",
    },
    tagStyles: {
      'h1': {'font-size': '2em', 'margin': '1em 0 0.8em', 'font-weight': '600', 'border-bottom': '1px solid #eee', 'padding-bottom': '0.5em'},
      'h2': {'font-size': '1.5em', 'margin': '1.2em 0 0.6em', 'font-weight': '600'},
      'h3': {'font-size': '1.25em', 'margin': '1em 0 0.5em', 'font-weight': '600'},
      'p': {'margin': '1em 0', 'line-height': '1.8'},
      'img': {'max-width': '100%', 'height': 'auto', 'margin': '1.5em auto', 'display': 'block', 'border-radius': '4px'},
      'pre': {
        'background-color': '#f8f8f8',
        'padding': '1em',
        'border-radius': '4px',
        'overflow': 'auto',
        'line-height': '1.45',
        'box-shadow': '0 1px 2px rgba(0,0,0,0.1)'
      },
      'code': {
        'font-family': "'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, monospace",
        'background-color': 'rgba(175,184,193,0.2)',
        'padding': '0.2em 0.4em',
        'border-radius': '3px',
        'font-size': '85%'
      },
      'blockquote': {
        'border-left': '4px solid #dfe2e5',
        'padding': '0 1em',
        'color': '#6a737d',
        'margin': '1.5em 0',
        'background-color': '#f8f9fa'
      },
      'ul': {'padding-left': '2em', 'margin': '1em 0'},
      'ol': {'padding-left': '2em', 'margin': '1em 0'},
      'li': {'margin': '0.5em 0'},
      'a': {
        'color': '#0366d6',
        'text-decoration': 'none',
      },
      'table': {
        'border-collapse': 'collapse',
        'width': '100%',
        'margin': '1.5em 0',
        'box-shadow': '0 1px 3px rgba(0,0,0,0.1)'
      },
      'th, td': {
        'border': '1px solid #dfe2e5',
        'padding': '0.6em 1em',
        'text-align': 'left'
      },
      'th': {
        'background-color': '#f6f8fa',
        'font-weight': '600'
      },
    },
  );
}