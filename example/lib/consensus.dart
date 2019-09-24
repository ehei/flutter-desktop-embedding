import 'package:flutter/material.dart';

class ConsensusState extends State<Consensus> {
  @override
  Widget build(BuildContext context) {
//    Sequence[] sequences = context.getSequences();

    return Text(
      '',
      style: TextStyle(fontFamily: 'Overpass', fontWeight: FontWeight.w100),
    );
  }
}

class Consensus extends StatefulWidget {
  @override
  ConsensusState createState() => ConsensusState();
}
