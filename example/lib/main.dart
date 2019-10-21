// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(MaterialApp(
    title: "Test App",
    home: Scaffold(
        appBar: AppBar(
          title: Text("Testing"),
        ),
        body: getListView()),
  ));
}

Widget getListView() {
  final listItems = getListElements();

  final listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      title: Text(listItems[index]),
    );
  });

  return listView;
}

List<String> getListElements() {
  final items = List<String>.generate(1000, (counter) {
    switch (counter) {
      case 0:
        {
          return 'g';
        }

      case 1:
        {
          return 'c';
        }

      case 2:
        {
          return 't';
        }

      default:
        {
          return 'a';
        }
    }
  });

  return items;
}
