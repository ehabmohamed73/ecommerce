import 'package:flutter/material.dart';

class coustomTextFormOuth extends StatelessWidget {
  final String textLable, textHint;
  final IconData textIcon;
  final TextEditingController? myController;
  final String? Function(String?) validFiled;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final void Function()? onTapIcon;
  const coustomTextFormOuth(
      {super.key,
      required this.textLable,
      required this.textHint,
      required this.textIcon,
      required this.myController,
      required this.validFiled,
      this.keyboardType,
      this.isObscureText,
      this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:
          isObscureText == null || isObscureText == false ? false : true,
      keyboardType: keyboardType,
      controller: myController,
      validator: validFiled,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 10),
          label: Text(textLable),
          hintText: textHint,
          hintStyle: const TextStyle(fontSize: 14),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(textIcon),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
