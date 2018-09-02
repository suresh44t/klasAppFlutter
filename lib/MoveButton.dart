import 'package:flutter/material.dart';

class MoveButton extends StatefulWidget {
  MoveButton({Key key, this.move, this.width, this.height, this.border, this.pos}) : super(key: key);
  final bool move;
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

  _holdB(bool move){
    setState(() {
      _colorNow = _holdColor;
      move = true;
    });
  }

  _releaseB(bool move){
    setState(() {
      _colorNow = _releaseColor;
      move = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: (_) => _holdB(widget.move),
      onTapUp: (_) => _releaseB(widget.move),
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