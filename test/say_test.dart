import 'dart:io';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_test/angel_test.dart';
import 'package:test/test.dart';
import 'package:twiml/twiml.dart' as twiml;
import 'package:xml/xml.dart' as xml;
import 'common.dart';

main() {
  group('say', () {
    Angel app;
    TestClient client;

    setUp(() async {
      app = new Angel()
        ..get('/hello', sendTwiml(new twiml.Response()..say('Hello, world!')))
        ..all('*', () => throw new AngelHttpException.NotFound());

      client = await connectTo(app);
    });

    tearDown(() => client.close());

    test('can say basic text', () async {
      var response = await client.get('/hello',
          headers: {HttpHeaders.ACCEPT: 'text/xml, application/json'});
      var doc = xml.parse(response.body);
      print(doc);
      expect(doc.rootElement.name.qualified, equals('Response'));

      var say = doc.rootElement.findElements('Say').first;
      expect(say.name.qualified, equals('Say'));
      expect(say.getAttribute('voice'), equals('man'));
      expect(int.parse(say.getAttribute('loop')), equals(1));
      expect(say.getAttribute('language'), equals('en'));
    });
  });
}
