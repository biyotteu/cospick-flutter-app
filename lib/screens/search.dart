import 'dart:ffi';

import 'package:cospick/common/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchPage(title: '검색'),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          elevation: 0.0,
          toolbarHeight: 40,
          backgroundColor: Colors.white,
          title:const Text('검색'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        body: const WhereCos(),
    );
  }
}

class WhereCos extends StatefulWidget {
  const WhereCos({Key? key}) : super(key: key);

  @override
  _WhereCosState createState() => _WhereCosState();
}

class _WhereCosState extends State<WhereCos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50,bottom:20),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "어떤 지역 코스를 찾으시나요?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: "Spoqa Han Sans Neo",
                    fontWeight: FontWeight.w700,

                  ),
                ),
              ),
            ),
            Container(
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff1f1f1),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12,),
                    const Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '검색어를 입력하세요.',
                          hintStyle: TextStyle(
                            color: Color(0xff848484),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 4),
                      child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.search)
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

class WhoWith extends StatefulWidget {
  const WhoWith({Key? key}) : super(key: key);

  @override
  _WhoWithState createState() => _WhoWithState();
}

class _WhoWithState extends State<WhoWith> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
