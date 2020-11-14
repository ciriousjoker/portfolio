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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Card(
        //   color: Colors.transparent,
        // child:
        SlimyCard(
          color: Colors.white,
          // width: 200,
          topCardHeight: 256,
          bottomCardHeight: 128,
          borderRadius: 24,
          topCardWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(child: Text("Top")),
            ],
          ),
          bottomCardWidget: Card(
            child: Column(
              children: [
                Card(child: Text("Contact me or smth")),
              ],
            ),
          ),
          slimeEnabled: true,
          // ),
        )
      ],
    );
  }
}
