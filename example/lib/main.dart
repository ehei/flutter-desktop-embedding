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

import 'package:example_flutter/sequence/sequence_model.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => SequenceModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // See https://github.com/flutter/flutter/wiki/Desktop-shells#fonts
        fontFamily: 'Roboto',
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible = false;
  bool _visible2 = false;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _visible = (_counter % 2 == 0) || (_counter % 3 == 0);
      _visible2 = (_counter % 3) == 0;
    });
  }

  void _addBase() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Container(
//              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    /*1*/
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*2*/
                        Row(children: [
                          Text(
                            'ACGTACGTACGTACGT',
                            style: TextStyle(
                                fontFamily: 'Overpass',
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        Visibility(
                          visible: _visible,
                          child: Row(
                            children: [
                              Text(
                                '  TGCATGCATGCA',
                                style: TextStyle(
                                    fontFamily: 'Overpass',
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: _visible2,
                          child: Row(
                            children: [
                              Text(
                                '                   GCATGC',
                                style: TextStyle(
                                    fontFamily: 'Overpass',
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  /*3*/
                  Icon(
                    Icons.star,
                    color: Colors.red[500],
                  ),
                  Text('41'),
                ],
              ),
            ),
            Container(
//              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    /*1*/
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*2*/
                        Row(children: [
                          Text(
                            '|1       |10       |20',
                            style: TextStyle(
                                fontFamily: 'Overpass',
                                fontWeight: FontWeight.bold),
                          ),
                        ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(children: [
                          Consumer<SequenceModel>(
                            builder: (context, sequenceModel, child) {
                              return Text('Total sequences: 0');
                            },
                          )
                        ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 16.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                      width: 16.0,
                      color: Colors.red,
                      child: SizedBox(
                          width: 100.0,
                          height: 100.0,
                          child: Center(
                            child: Text('A',
                                maxLines: 1,
                                style: TextStyle(color: Colors.white)),
                          ))),
                  Container(
                      width: 16.0,
                      color: Colors.blue,
                      child: SizedBox(
                          width: 100.0,
                          height: 100.0,
                          child: Center(
                            child: Text('GATC',
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'dnagc2019',
                                    fontWeight: FontWeight.w100)),
                          ))),
                  Container(
                    width: 16.0,
                    color: Colors.green,
                  ),
                  Container(
                    width: 16.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 16.0,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                  '*-:=?ABCDGHKMNRSTUVWXYabcdghkmnrstuvwxyz|¥¨©®°µßåç˙˚˜‌‍‎‏† ', // as it appears in the font file
                  //  both|single strand top|----double strand|single strand bottom
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'dnagc2019',
                      fontWeight: FontWeight.w100,
                      fontSize: 22)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
