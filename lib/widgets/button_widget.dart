import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String txt;
  final VoidCallback ontap;

  final Color colorr;
  const ButtonWidget({
    super.key,
    required this.txt,
    required this.ontap,
    required this.colorr,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: ontap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(colorr),
            elevation: MaterialStateProperty.all(5),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            overlayColor: MaterialStateProperty.all(Colors.white)),
        child: Text(
          txt,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class Previewbtn extends StatelessWidget {
  final String txt;
  final VoidCallback ontap;
  final Color colorr;
  const Previewbtn(
      {super.key,
      required this.txt,
      required this.ontap,
      required this.colorr});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: ontap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colorr),
          elevation: MaterialStateProperty.all(5),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                  width: 1, color: Color.fromARGB(255, 109, 108, 108)),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          // overlayColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Text(
          txt,
          style: const TextStyle(color: Color.fromARGB(255, 109, 108, 108)),
        ),
      ),
    );
  }
}
