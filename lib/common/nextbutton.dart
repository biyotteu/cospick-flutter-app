import 'package:flutter/material.dart';

Widget myButton(title,onPressed){
  return Padding(
    padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => const Color(0xffF1C40F)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)))),
      child: Container(
        height: 44,
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      )),
  );

}