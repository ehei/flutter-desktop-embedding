import 'package:example_flutter/sequence/sequence_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:storyboard/storyboard.dart';

class SequenceStory extends Story {
  @override
  List<Widget> get storyContent {
    return [new SequenceWidget()];
  }
}
