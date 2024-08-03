// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class JText extends StatelessWidget {
  final String data;
  final FontWeight? weight;
  final double? size;
  final Color? color;
  final int? maxLines;
  final int? minLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  const JText(
    this.data, {
    this.weight,
    this.size,
    this.color,
    this.maxLines,
    this.minLines,
    this.overflow,
    this.letterSpacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontWeight: weight,
        fontSize: size,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
