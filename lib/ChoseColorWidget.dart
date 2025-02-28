import 'package:flutter/material.dart';

class ChoseColorWidget extends StatefulWidget {
  final Color colorButtonRef;
  final String idRef;
  final String currentBagidRef;
  final Function onUpdateRef;
  ChoseColorWidget({
    required this.colorButtonRef,
    required this.idRef,
    required this.onUpdateRef,
    required this.currentBagidRef,
  });

  @override
  _ChoseColorWidgetState createState() => _ChoseColorWidgetState();
}

class _ChoseColorWidgetState extends State<ChoseColorWidget> {
  late Color colorButton;
  late String id1;
  late String currentBagid;
  late Function onUpdate;

  @override
  void initState() {
    super.initState();
    onUpdate = widget.onUpdateRef;
    colorButton = widget.colorButtonRef;
    id1 = widget.idRef;
  }

  @override
  Widget build(BuildContext context) {
    currentBagid = widget.currentBagidRef;

    return GestureDetector(
      onTap: () {
        onUpdate(id1);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: currentBagid == id1
              ? Border.all(color: colorButton, width: 1)
              : null,
        ),
        padding: EdgeInsets.all(5),
        child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorButton,
            )),
      ),
    );
  }
}
