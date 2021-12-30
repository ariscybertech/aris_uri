// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library uri.uri_builder_test;

import 'package:unittest/unittest.dart';
import 'package:uri/uri.dart';

void main() {
  group('UriBuilder', () {
    test('should build a Uri', () {
      var builder = new UriBuilder()
        ..fragment = 'fragment'
        ..host = 'host'
        ..path = 'path'
        ..port = 42
        ..scheme = 'ftp'
        ..userInfo = 'userInfo'
        ..queryParameters['q'] = 'v';
      expect(builder.build(),
          Uri.parse('ftp://userInfo@host:42/path?q=v#fragment'));
    });

    test('should build a Uri from a Uri', () {
      var uri = Uri.parse('http://example.com:8080/path?a=b#fragment');
      var builder = new UriBuilder.fromUri(uri);
      expect(builder.build().toString(), uri.toString());
    });

    test("should preserve paths when there's no host", () {
      var uri = (new UriBuilder()..path = 'path').build();
      expect(uri.path, 'path');
    });

    // regression test for https://github.com/google/uri.dart/issues/16
    test("shouldn't add extra junk with empty parts", () {
      var uri = (new UriBuilder()..path = 'path').build();
      expect(uri.toString(), 'path');
    });
  });
}
