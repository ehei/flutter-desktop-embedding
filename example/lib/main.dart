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
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      home: MyHomePage(title: 'Flutter Demo Home Page '),
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
                  '*-:=?ABCDGHKMNRSTUVWXYabcdghkmnrstuvwxyz|¥¨©®°µßåç˙˚˜‌‍‎‏† ', // as it appears in the font rfile
                  //  both|single strand top|----double strand|single strand bottom
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'dnagc2019',
                      fontWeight: FontWeight.w100,
                      fontSize: 22)),
            ),
            Container(
                child: new Checkbox(
                    value: false,
                    onChanged: (bool newValue) {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new FilePickerDemo()),
                      );
                    })),
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

class FilePickerDemo extends StatefulWidget {
  @override
  _FilePickerDemoState createState() => new _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePickerDemo> {
  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, fileExtension: _extension);
        } else {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: _pickingType, fileExtension: _extension);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : '...';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('File Picker example app'),
        ),
        body: new Center(
            child: new Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: new SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: new DropdownButton(
                      hint: new Text('LOAD PATH FROM'),
                      value: _pickingType,
                      items: <DropdownMenuItem>[
                        new DropdownMenuItem(
                          child: new Text('FROM ANY'),
                          value: FileType.ANY,
                        ),
                        new DropdownMenuItem(
                          child: new Text('CUSTOM FORMAT'),
                          value: FileType.CUSTOM,
                        ),
                      ],
                      onChanged: (value) => setState(() {
                            _pickingType = value;
                            if (_pickingType != FileType.CUSTOM) {
                              _controller.text = _extension = '';
                            }
                          })),
                ),
                new ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 100.0),
                  child: _pickingType == FileType.CUSTOM
                      ? new TextFormField(
                          maxLength: 15,
                          autovalidate: true,
                          controller: _controller,
                          decoration:
                              InputDecoration(labelText: 'File extension'),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            RegExp reg = new RegExp(r'[^a-zA-Z0-9]');
                            if (reg.hasMatch(value)) {
                              _hasValidMime = false;
                              return 'Invalid format';
                            }
                            _hasValidMime = true;
                            return null;
                          },
                        )
                      : new Container(),
                ),
                new ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 200.0),
                  child: new SwitchListTile.adaptive(
                    title: new Text('Pick multiple files',
                        textAlign: TextAlign.right),
                    onChanged: (bool value) =>
                        setState(() => _multiPick = value),
                    value: _multiPick,
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: new RaisedButton(
                    onPressed: () => _openFileExplorer(),
                    child: new Text("Open file picker "),
                  ),
                ),
                new Builder(
                  builder: (BuildContext context) => _loadingPath
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: const CircularProgressIndicator())
                      : _path != null || _paths != null
                          ? new Container(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              height: MediaQuery.of(context).size.height * 0.50,
                              child: new Scrollbar(
                                  child: new ListView.separated(
                                itemCount: _paths != null && _paths.isNotEmpty
                                    ? _paths.length
                                    : 1,
                                itemBuilder: (BuildContext context, int index) {
                                  final bool isMultiPath =
                                      _paths != null && _paths.isNotEmpty;
                                  final String name = 'File $index: ' +
                                      (isMultiPath
                                          ? _paths.keys.toList()[index]
                                          : _fileName ?? '...');
                                  final path = isMultiPath
                                      ? _paths.values.toList()[index].toString()
                                      : _path;

                                  return new ListTile(
                                    title: new Text(
                                      name,
                                    ),
                                    subtitle: new Text(path),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        new Divider(),
                              )),
                            )
                          : new Container(),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
