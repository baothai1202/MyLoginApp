import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shoppingproduct.dart';

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
            height: currentBagid == id1 ? 15 : 20,
            width: currentBagid == id1 ? 15 : 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorButton,
            )),
      ),
    );
  }
}

class AddtoCartWidget extends StatefulWidget {
  final Handbags currentBagRef;
  final Function onUpdateRef;

  AddtoCartWidget({
    required this.currentBagRef,
    required this.onUpdateRef,
  });
  @override
  _AddtoCartWidgetState createState() => _AddtoCartWidgetState();
}

class _AddtoCartWidgetState extends State<AddtoCartWidget> {
  bool isPressed = false;
  late Handbags currentBag;
  late int count;
  late Function onUpdate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    onUpdate = widget.onUpdateRef;
  }

  @override
  Widget build(BuildContext context) {
    currentBag = widget.currentBagRef;
    return GestureDetector(
      onTapDown: (details) {
        isPressed = true;

        onUpdate();
      },
      onTapUp: (details) {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: isPressed ? currentBag.color : Colors.white,
              border: Border.all(color: currentBag.color),
              borderRadius: BorderRadius.circular(20)),
          child: Icon(
            Icons.add_shopping_cart,
            color: isPressed ? Colors.white : currentBag.color,
          )),
    );
  }
}
