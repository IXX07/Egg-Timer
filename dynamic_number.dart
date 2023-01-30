import 'package:flutter/material.dart';

class DynamicNumber extends StatefulWidget {
  const DynamicNumber({Key? key, required this.value, required this.onTapUp, required this.onTapDown}) : super(key: key);

  final int value;
  final Function onTapUp, onTapDown;

  @override
  State<DynamicNumber> createState() => _DynamicNumberState();
}

class _DynamicNumberState extends State<DynamicNumber> {

  InkWell _getButton(Function func, IconData icon) {
    return InkWell(
      onTap: func(),
      child: Icon(icon, size: 50, color: Colors.white)
    );
  }

  String zero(int value) {
    var result = value.toString();
    if (result.length < 2) {
      result = '0$result';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Column(
        children: [
          _getButton(widget.onTapUp, Icons.keyboard_arrow_up_rounded),
          Text(zero(widget.value),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40
            )
          ),
          _getButton(widget.onTapDown, Icons.keyboard_arrow_down_rounded)
        ]
      )
    );
  }
}