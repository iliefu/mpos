import 'package:flutter/material.dart';

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
      'font-family': "Georgia, serif",
      'line-height': "1.9",
      'font-size': "17px",
      'color': "#2c3e50",
      'padding': "20px",
      'background-color': "#fcfcfc",
    },
    tagStyles: {
      'h1': {'font-size': '28px', 'margin': '28px 0 20px', 'font-weight': '500', 'border-bottom': '1px solid #eaecef', 'padding-bottom': '8px'},
      'h2': {'font-size': '24px', 'margin': '24px 0 16px', 'font-weight': '500', 'border-bottom': '1px solid #eaecef', 'padding-bottom': '6px'},
      'h3': {'font-size': '20px', 'margin': '20px 0 14px', 'font-weight': '500'},
      'p': {'margin': '18px 0', 'line-height': '1.9'},
      'img': {'max-width': '100%', 'height': 'auto', 'margin': '20px 0', 'border-radius': '4px'},
      'pre': {'background-color': '#f8f9fa', 'padding': '16px', 'border-radius': '6px', 'overflow': 'auto', 'border': '1px solid #eaecef'},
      'code': {'font-family': 'SFMono-Regular, Consolas, Liberation Mono, Menlo, monospace', 'background-color': 'rgba(27,31,35,0.05)', 'padding': '0.2em 0.4em', 'border-radius': '3px'},
      'blockquote': {'border-left': '4px solid #dfe2e5', 'padding': '0 16px', 'color': '#6a737d', 'margin': '16px 0', 'font-style': 'italic'},
      'ul': {'padding-left': '32px'},
      'ol': {'padding-left': '32px'},
      'li': {'margin': '8px 0'},
      'a': {'color': '#1a73e8', 'text-decoration': 'none', 'border-bottom': '1px solid #d2e3fc'},
    },
  );
}