# dart-twiml
[![pub](https://img.shields.io/badge/pub-v0.0.0-red.svg)](https://pub.dartlang.org/packages/twiml)
[![build status](https://travis-ci.org/thosakwe/dart-twiml.svg?branch=master)](https://travis-ci.org/thosakwe/dart-twiml)

TwiML response generator for Dart. Technically, this package should run anywhere, as it has no dependencies.
It can easily be used within server-side code. :)

# Usage
See the API docs, or the test cases in this repoistory (which ultimately have 100% code coverage).

```dart
import 'package:twiml/twiml.dart' as twiml;

main() {
    var response = new twiml.Response()
        ..say('Hello, world!', voice: Voice.MAN);

    // Build XML by calling `toString`
    print('Generated TwiML:');
    print(response);
}
```