import 'package:flutter/material.dart';
import 'package:fongi_admin_portal/core/constants.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? Function(String? value) validate;
  final Function(String)? onChange;
  final TextEditingController controller;
  final int maxLines;
  const CustomTextField(
      {Key? key,
      this.label,
      required this.validate,
      this.onChange,
      required this.controller,
        this.maxLines = 1 ,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        maxLines: maxLines,
        style: const TextStyle(
          color: kMainColor,
        ),
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: kMainColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: kMainColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kMainColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusColor: kMainColor,
        ),
        validator: validate,
        onChanged: onChange,
      ),
    );
  }
}
