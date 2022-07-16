import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'export_widgets.dart';

class CustomTextField extends StatelessWidget {
  final String hint;

  final TextEditingController controller;
  final Function(String text) onChanged;
  final FocusNode focus;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final bool enabled;
  final int maxLenght;
  final int maxLines;
  final TextInputAction textInputAction;
  final Function(String value) validator;
  final Function onEditingComplete;
  final Widget suffixIcon;
  final bool obscure;

  CustomTextField(
      {this.hint,
      this.keyboardType,
      this.textInputAction,
        this.suffixIcon,
        this.onEditingComplete,
      this.maxLines,
      this.enabled,
      this.maxLenght,
        this.obscure,
      this.controller,
      this.onChanged,
      this.focus,
        this.validator,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      focusNode: focus,
      onChanged: onChanged,
      maxLength: maxLenght,
      maxLines: maxLines,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      obscureText: obscure ?? false,
      validator: validator,
      style: GoogleFonts.poppins(
        color: Theme.of(context)
            .textTheme
            .bodyText1
            .color, // Theme.of(context).textTheme.headline6.color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodyText1.color),
          counter: SizedBox.shrink(),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          filled: true,

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent)),
        errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            borderSide: BorderSide(color: Theme.of(context).errorColor)),

          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            borderSide: BorderSide(color: Theme.of(context).errorColor)),

        suffixIcon: suffixIcon,
      ),
    );
  }
}
