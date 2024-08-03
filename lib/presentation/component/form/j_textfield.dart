import 'package:flutter/material.dart';
import 'package:jumbled/common/theme.dart';

class JTextField extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final Widget? prefix;
  final Widget? suffix;
  final double? fontSize;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool? readonly;
  final bool? obscure;
  final VoidCallback? onTap;
  final TextStyle? style;
  final bool? expanded;
  final int? maxLines;
  final int? minLines;
  final double? width;
  final bool? enable;
  final bool? hasmultiLines;
  final Function(PointerDownEvent)? onTapOutside;
  final Function(String)? onChanged;
  final double? radius;
  final Color? borderColor;
  const JTextField(
    this.text, {
    super.key,
    this.controller,
    this.keyboard,
    this.prefix,
    this.suffix,
    this.fontSize,
    this.validator,
    this.initialValue,
    this.readonly,
    this.obscure = false,
    this.onTap,
    this.style,
    this.expanded,
    this.maxLines,
    this.minLines,
    this.width,
    this.enable,
    this.hasmultiLines,
    this.onTapOutside,
    this.onChanged,
    this.radius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        onTap: onTap,
        onTapOutside: onTapOutside,
        onChanged: onChanged,
        style: style ??
            TextStyle(
              fontSize: 15,
              color: JTheme.primaryColor,
            ),
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: keyboard,
        initialValue: initialValue,
        readOnly: readonly ?? false,
        expands: expanded ?? false,
        enabled: enable,
        obscureText: obscure ?? false,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            fontSize: 14,
          ),
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          labelText: text,
          hintTextDirection: TextDirection.ltr,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 15,
            color: JTheme.tertiaryColor,
          ),
          prefixIcon: prefix,
          suffixIcon: suffix,
          border: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
              color: borderColor ?? JTheme.primaryColor,
            ),
            borderRadius: BorderRadius.circular(radius ?? 0),
          ),
          disabledBorder: OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(
                color: borderColor ?? JTheme.primaryColor,
              ),
              borderRadius: BorderRadius.circular(radius ?? 0)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 0),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(
                color: borderColor ?? JTheme.primaryColor,
              ),
              borderRadius: BorderRadius.circular(radius ?? 0)),
          focusedBorder: OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(
                color: borderColor ?? JTheme.primaryColor,
              ),
              borderRadius: BorderRadius.circular(radius ?? 0)),
        ),
      ),
    );
  }
}
