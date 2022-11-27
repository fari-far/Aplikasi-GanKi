import 'package:flutter/material.dart';
import 'package:grocery_app/styles/colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final double roundness;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final Widget trailingWidget;
  final Function onPressed;
  final VisualDensity visualDensity;

  const AppButton({
    Key key,
    this.label,
    this.roundness = 18,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(vertical: 24),
    this.trailingWidget,
    this.onPressed,
    this.visualDensity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0));
          }),
          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 18, 209, 18)),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (states) => TextStyle(color: Colors.white)),
          elevation: MaterialStateProperty.all<double>(0.0),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 25, vertical: 24)),
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            if (trailingWidget != null)
              Positioned(
                top: 0,
                right: 25,
                child: trailingWidget,
              )
          ],
        ),
        onPressed: () {
          if (onPressed != null) onPressed();
        },
      ));
  }
}
