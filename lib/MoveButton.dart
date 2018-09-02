import 'package:flutter/material.dart';

class MoveButton extends StatefulWidget {
  MoveButton({Key key, this.move, this.width, this.height, this.border, this.pos}) : super(key: key);
  bool move;
  final double width;
  final double height;
  final double border;
  final EdgeInsets pos;

  @override
  MoveButtonState createState() => MoveButtonState();
}

class MoveButtonState extends State<MoveButton> {
  Color _holdColor = Color(0xFF404b69);
  Color _releaseColor = Color(0xFF00818a);
  Color _colorNow = Color(0xFF00818a);

  _holdB(){
    setState(() {
      _colorNow = _holdColor;
      widget.move = true;
    });
  }

  _releaseB(){
    setState(() {
      _colorNow = _releaseColor;
      widget.move = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: (_) => _holdB(),
      onTapUp: (_) => _releaseB(),
      child: new Container(
        decoration: new BoxDecoration(
          color: _colorNow,
          borderRadius: BorderRadius.all(Radius.circular(widget.border)),
        ),
        margin: widget.pos,
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}