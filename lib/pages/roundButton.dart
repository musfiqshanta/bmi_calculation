import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon, required this.onpressed})
      : super(key: key);
  final IconData icon;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minHeight: 40, minWidth: 40),
      shape: CircleBorder(),
      fillColor: Colors.white,
      child: Icon(icon),
      //onPressed: onpressed,
      onPressed: onpressed,
    );
  }
}
