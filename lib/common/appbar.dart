import 'package:flutter/material.dart';

AppBar MyAppBar(title, onPressed, isleading){
  var leading = null;
  if(isleading){
    leading = IconButton(
      icon: const Icon(Icons.chevron_left,color: Colors.black,),
      onPressed: onPressed,
    );
  }
  return AppBar(
    leading: leading,
    elevation: 0.5,
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