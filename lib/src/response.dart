import 'dart:convert';
import 'voice.dart';

const String _INDENT = '    ';

class Response {
  final StringBuffer _buf = new StringBuffer()
    ..writeln('<?xml version="1.0" encoding="UTF-8"?>')
    ..writeln('<Response>');

  /// Read text to the caller.
  void say(String text,
      {String voice: Voice.MAN, int loop: 1, String language: 'en'}) {
    _buf
      ..write(_INDENT)
      ..write(
          '<Say voice="${HTML_ESCAPE.convert(voice)}" loop="$loop" language="$language">')
      ..write(HTML_ESCAPE.convert(text))
      ..writeln('</Say>');
  }

  @override
  String toString() {
    _buf.writeln('</Response>');
    return _buf.toString();
  }
}
