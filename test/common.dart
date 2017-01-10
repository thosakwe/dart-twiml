import 'dart:io';
import 'package:angel_framework/angel_framework.dart';
import 'package:http/http.dart' as http;
import 'package:twiml/twiml.dart' as twiml;

http.Response getResponse(http.Response response) {
  print(response.body);
  return response;
}

/// Auto-serializes TwiML responses.
RequestMiddleware serializeTwimlResponses() {
  return (req, res) async {
    // Todo: Fix broken Angel build, then this will work
    var oldSerializer = res.serializer;

    res.serializer = (value) {
      if (value is twiml.Response) {
        res.contentType = new ContentType('text', 'xml');
        return value.toString();
      } else
        return oldSerializer(value);
    };

    return true;
  };
}

/// Sends a TwiML response.
RequestHandler sendTwiml(twiml.Response response) {
  return (req, res) async {
    res
      ..contentType = new ContentType('text', 'xml')
      ..write(response);
    return false;
  };
}
