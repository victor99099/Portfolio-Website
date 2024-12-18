import 'dart:html' as html;
bool isAndroidWeb() {
  final userAgent = html.window.navigator.userAgent.toLowerCase();
  return userAgent.contains("android");
  return true;
}