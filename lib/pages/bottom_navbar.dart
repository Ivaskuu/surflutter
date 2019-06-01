import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  final int actualItem;
  final Function(int) onActualItemChanged;

  const BottomNavbar({
    Key key,
    @required this.actualItem,
    @required this.onActualItemChanged,
  }) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(64.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () => changeItem(0),
              icon: Icon(
                Icons.question_answer,
                color: widget.actualItem == 0
                    ? Theme.of(context).accentColor
                    : Colors.black26,
              ),
            ),
            IconButton(
              onPressed: () => changeItem(1),
              icon: Icon(
                Icons.line_weight,
                color: widget.actualItem == 1
                    ? Theme.of(context).accentColor
                    : Colors.black26,
              ),
            ),
            IconButton(
              onPressed: () => changeItem(2),
              icon: Icon(
                Icons.work,
                color: widget.actualItem == 2
                    ? Theme.of(context).accentColor
                    : Colors.black26,
              ),
            ),
            IconButton(
              onPressed: () => changeItem(3),
              icon: Icon(
                Icons.account_circle,
                color: widget.actualItem == 3
                    ? Theme.of(context).accentColor
                    : Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeItem(int i) {
    if (i != widget.actualItem) widget.onActualItemChanged(i);
  }
}
