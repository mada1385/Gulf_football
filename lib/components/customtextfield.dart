import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gulf_football/config/colors.dart';

class CustomTextfield extends StatelessWidget {
  List<MultiValidator> validators = [
    MultiValidator([
      RequiredValidator(errorText: ''),
    ]),
    MultiValidator([
      RequiredValidator(errorText: 'اسم المستخدم مطلوب'),
      EmailValidator(errorText: "هذا البريد غير صالح")
    ]),
    MultiValidator([
      RequiredValidator(errorText: 'كلمة المرور مطلوبة'),
      MinLengthValidator(8,
          errorText: 'يجب أن تتكون كلمة المرور من 8 أرقام على الأقل'),
      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
          errorText: 'يجب تحتوي كلمة المرور على حرف خاص واحد على الاقل'),
    ]),
  ];

  final String hint, label;
  final Widget suffix;
  final IconData priffix;
  final TextEditingController controller;
  final bool isobscure;
  final int validator;
  final Function customvalidator;

  CustomTextfield(
      {Key key,
      this.hint,
      this.label,
      this.priffix,
      this.suffix,
      this.controller,
      this.isobscure = false,
      this.validator = null,
      this.customvalidator = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: isobscure,
        decoration: new InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: accentcolor)),
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: accentcolor)),
            hintText: hint,
            labelText: label,
            labelStyle: TextStyle(
              color: textcolor,
              fontFamily: 'cairo',
            ),
            prefixIcon: Icon(
              priffix,
              color: accentcolor,
            ),
            prefixText: ' ',
            suffix: suffix,
            suffixStyle: const TextStyle(
              color: accentcolor,
              fontFamily: 'cairo',
            )),
        validator: validators[validator]);
  }
}
