import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoicemaker/utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hinttxt;
  final TextInputType inputType;
  final String? Function(String?)? validatorr;
  final List<TextInputFormatter>? inputformaters;
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hinttxt,
      this.validatorr,
      this.inputformaters,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // cursorColor: Colors.white,
      validator: validatorr,
      keyboardType: inputType,
      inputFormatters: inputformaters,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        // enabledBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(width: 1, color: Colors.white),
        //     borderRadius: BorderRadius.circular(25)),
        filled: true,
        fillColor: Colors.white,
        hintText: hinttxt,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}

class PasswordTextfield extends StatelessWidget {
  final TextEditingController passwordController;
  final String hinttxt;
  final bool obscureText;
  final VoidCallback btn;
  final IconData icn;
  final TextInputType inputType;
  final String? Function(String?)? validatorr;
  final List<TextInputFormatter>? inputformaters;
  const PasswordTextfield(
      {super.key,
      required this.passwordController,
      required this.hinttxt,
      required this.obscureText,
      required this.btn,
      required this.icn,
      required this.inputType,
      this.validatorr,
      this.inputformaters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      keyboardType: inputType,
      obscureText: obscureText, validator: validatorr,
      inputFormatters: inputformaters,
      // cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        // enabledBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(width: 2, color: Colors.white),
        //     borderRadius: BorderRadius.circular(25)),
        filled: true,
        fillColor: Colors.white,
        hintText: hinttxt,
        suffixIcon: IconButton(onPressed: btn, icon: Icon(icn)),
        hintStyle:
            TextStyle(letterSpacing: 0.1, color: Colors.grey.withOpacity(0.4)),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}

class InvoiceField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputtype;
  final String hinttext;
  final String? Function()? ontap;
  final String? Function(String?)? validatorr;

  const InvoiceField(
      {super.key,
      required this.controller,
      required this.hinttext,
      this.inputtype,
      this.ontap,
      this.validatorr});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller, keyboardType: inputtype,
        onTap: ontap,
        // cursorColor: Colors.white,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          // enabledBorder: OutlineInputBorder(
          //     borderSide: const BorderSide(width: 1, color: Colors.white),
          //     borderRadius: BorderRadius.circular(25)),
          filled: true,
          fillColor: ClrData().g2,
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}

class DateField extends StatelessWidget {
  final TextEditingController controller;
  final String txt;
  final VoidCallback ontap;
  const DateField(
      {super.key,
      required this.controller,
      required this.txt,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        // cursorColor: Colors.white,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          // enabledBorder: OutlineInputBorder(
          //     borderSide: const BorderSide(width: 1, color: Colors.white),
          //     borderRadius: BorderRadius.circular(25)),
          filled: true,
          fillColor: ClrData().g2,
          hintText: txt,
          suffixIcon: IconButton(
              onPressed: ontap,
              icon: Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10)),
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}

class ProfilePassword extends StatelessWidget {
  final TextEditingController passwordController;
  final String hinttxt;
  final bool obscureText;
  final VoidCallback btn;
  final IconData icn;
  final TextInputType inputType;
  final String? Function(String?)? validatorr;
  final List<TextInputFormatter>? inputformaters;
  const ProfilePassword(
      {super.key,
      required this.passwordController,
      required this.hinttxt,
      required this.obscureText,
      required this.btn,
      required this.icn,
      required this.inputType,
      this.validatorr,
      this.inputformaters});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: passwordController, keyboardType: inputType,
        obscureText: obscureText,
        // cursorColor: Colors.white,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          // enabledBorder: OutlineInputBorder(
          //     borderSide: const BorderSide(width: 1, color: Colors.white),
          //     borderRadius: BorderRadius.circular(25)),
          filled: true,
          fillColor: ClrData().g2,
          hintText: hinttxt,
          suffixIcon: IconButton(onPressed: btn, icon: Icon(icn)),
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
