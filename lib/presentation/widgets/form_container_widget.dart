import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final bool? textInputAction;

  const FormContainerWidget(
      {super.key,
      this.controller,
      this.fieldKey,
      this.isPasswordField,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType,
      this.textInputAction});

  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      margin: const EdgeInsets.symmetric(horizontal: 0),
      width: double.infinity,
      // decoration: BoxDecoration(
      //   color: Colors.lightBlue,
      // ),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        textInputAction: widget.textInputAction == true
            ? TextInputAction.done
            : TextInputAction.next,
        obscureText: widget.isPasswordField == true ? obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: (value) => value.replaceAll(" ", ""),
        decoration: InputDecoration(
            // border: InputBorder.none,
            filled: false,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w300),
            prefixIcon: GestureDetector(
                child: widget.isPasswordField == true
                    ? const Icon(
                        Icons.lock,
                        color: Color(0XFF2470b8),
                        size: 22,
                      )
                    : const Icon(
                        Icons.email,
                        color: Color(0XFF2470b8),
                        size: 22,
                      )),
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: widget.isPasswordField == true
                    ? Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: obscureText == false
                            ? const Color(0XFF2470b8)
                            : const Color(0XFF2470b8),
                      )
                    : const SizedBox())),
      ),
    );
  }
}
