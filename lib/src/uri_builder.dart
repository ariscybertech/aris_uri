// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library uri.builder;

import 'package:quiver/strings.dart' show emptyToNull, nullToEmpty;

/**
 * A mutable holder for incrementally building [Uri]s.
 */
class UriBuilder {
  String fragment;
  String host;
  String path;
  int port;
  Map<String, String> queryParameters;
  String scheme;
  String userInfo;

  UriBuilder()
      : fragment = '',
        host = '',
        path = '',
        port = 0,
        queryParameters = <String, String>{};

  UriBuilder.fromUri(Uri uri)
      : fragment = uri.fragment,
        host = uri.host,
        path = uri.path,
        port = uri.port,
        queryParameters = new Map<String, String>.from(uri.queryParameters),
        scheme = uri.scheme,
        userInfo = uri.userInfo;

  Uri build() => new Uri(
      fragment: emptyToNull(fragment),
      host: emptyToNull(host),
      path: emptyToNull(path),
      port: port,
      queryParameters: queryParameters == null || queryParameters.isEmpty ?
          null : queryParameters,
      scheme: nullToEmpty(scheme),
      userInfo: nullToEmpty(userInfo));

  String toString() => build().toString();
}
