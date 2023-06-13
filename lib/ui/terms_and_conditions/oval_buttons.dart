import 'package:flutter/material.dart';

import 'package:capstone/consts/colors.dart';

class OvalButton extends StatefulWidget {
  final String text;
  final Color fontColor;
  final Color backgroundColor;
  final Color borderColor;
  final void Function() ontap;

  const OvalButton({
    super.key,
    required this.text,
    required this.ontap,
    this.fontColor = GColors.WHITE,
    this.backgroundColor = GColors.TRANSPARENT,
    this.borderColor = GColors.CRYPTOLAB_PURPLE,
  });

  @override
  State<OvalButton> createState() => OvalButtonState();
}

class OvalButtonState extends State<OvalButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      onLongPress: widget.ontap,
      hoverColor: GColors.TRANSPARENT,
      highlightColor: GColors.TRANSPARENT,
      child: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.fromLTRB(35, 20, 35, 20),
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: widget.borderColor, width: 2)),
        child: Center(
          child: Text(widget.text,
              style: TextStyle(
                  color: widget.fontColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 17)),
        ),
      ),
    );
  }
}
