import 'package:flutter/material.dart';

AppBar MyAppBar(title,onPressed){
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.chevron_left,color: Colors.black,),
      onPressed: onPressed,
    ),
    elevation: 0.0,
    toolbarHeight: 40,
    backgroundColor: Colors.white,
    title: Text(title),
    centerTitle: true,
    titleTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold
    ),
  );
}