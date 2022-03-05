import 'package:flutter/material.dart';

Widget vector1On = Container(
  alignment: Alignment.center,
  width: 20,
  height: 20,
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xffe26a6a),
  ),
  child: const Text(
    "1",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontFamily: "Spoqa Han Sans Neo",
      fontWeight: FontWeight.w700,
    ),
  ),
);
Widget vector2On = Container(
  alignment: Alignment.center,
  width: 20,
  height: 20,
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xfff1c40f),
  ),
  child: const Text(
    "2",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontFamily: "Spoqa Han Sans Neo",
      fontWeight: FontWeight.w700,
    ),
  ),
);
Widget vector2Off = Container(
  alignment: Alignment.center,
  width: 20,
  height: 20,
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xffbbbbbb),
  ),
  child: const Text(
    "2",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontFamily: "Spoqa Han Sans Neo",
      fontWeight: FontWeight.w700,
    ),
  ),
);
Widget vector3On = Container(
  alignment: Alignment.center,
  width: 20,
  height: 20,
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xff656cd2),
  ),
  child: const Text(
    "3",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontFamily: "Spoqa Han Sans Neo",
      fontWeight: FontWeight.w700,
    ),
  ),
);
Widget vector3Off = Container(
  alignment: Alignment.center,
  width: 20,
  height: 20,
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xffBBBBBB),
  ),
  child: const Text(
    "3",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontFamily: "Spoqa Han Sans Neo",
      fontWeight: FontWeight.w700,
    ),
  ),
);
Widget bar12On = Container(
  width: 87,
  height: 3,
  decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xffe26a6a), Color(0xfff1c40f)],
      )),
);
Widget bar23On = Container(
  width: 87,
  height: 3,
  decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xfff1c40f), Color(0xff656cd2)],
      )),
);
Widget barOff = Container(
  width: 87,
  height: 3,
  color: const Color(0xffbbbbbb),
);