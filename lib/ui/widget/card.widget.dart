import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SlimyCard(
        color: Colors.red,
        width: 200,
        topCardHeight: 400,
        bottomCardHeight: 200,
        borderRadius: 15,
        topCardWidget: Container(
          child: Text("Image or smth"),
        ),
        bottomCardWidget: Container(
          child: Text("Contact me or smth"),
        ),
        slimeEnabled: true,
      ),
    );
  }
}
