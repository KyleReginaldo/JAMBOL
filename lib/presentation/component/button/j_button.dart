// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:jumbled/common/theme.dart';
import 'package:jumbled/presentation/component/typography/j_text.dart';

class JElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final BorderSide? borderSide;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final double? radius;
  final Size? size;
  final FontWeight? weight;
  final double? letterSpacing;
  const JElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.borderSide,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.radius,
    this.size,
    this.weight,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: size != null ? MaterialStatePropertyAll(size) : null,
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 25))),
        side: MaterialStatePropertyAll(borderSide),
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        foregroundColor: MaterialStatePropertyAll(foregroundColor),
        elevation:
            elevation != null ? MaterialStatePropertyAll(elevation) : null,
      ),
      child: JText(
        text,
        weight: weight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class JOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? borderColor;
  final Color? foregroundColor;
  final BorderSide? borderSide;
  final Size? size;
  final FontWeight? weight;
  final double? letterSpacing;

  const JOutlinedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.borderColor,
    this.foregroundColor,
    this.borderSide,
    this.size,
    this.weight,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: size != null ? MaterialStatePropertyAll(size) : null,
        side: MaterialStatePropertyAll(
          BorderSide(
            color: borderColor ?? JTheme.primaryColor,
          ),
        ),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: borderSide ?? BorderSide.none,
        )),
        foregroundColor: MaterialStatePropertyAll(foregroundColor),
      ),
      child: JText(
        text,
        weight: weight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class JTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? textColor;
  const JTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(textColor),
      ),
      child: JText(text),
    );
  }
}
