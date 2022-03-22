import 'dart:convert';

import 'package:cospick/common/place.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPlace extends StatefulWidget {
  const SearchPlace({Key? key}) : super(key: key);

  @override
  State<SearchPlace> createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  List<Widget> _placesWidget = [];
  void _submit(String text) async{
    final res = await http.get(
        Uri.parse("https://openapi.naver.com/v1/search/local.json?display=10&query="+text+""),
        headers: {"X-Naver-Client-Id":"CJIPetUmj4W7HzUqvGYx","X-Naver-Client-Secret":"w4kZWyMloH"}
    );
    debugPrint(res.statusCode.toString());
    if(res.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(res.body);
      final int total = json['display'];
      List<Widget> items = [];
      json['items'].forEach((cur){
        Place p = Place.fromJson(cur);
        p.title = p.title.replaceAll("<b>", "").replaceAll("</b>", "");
        items.add(
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.5,
                            color: Colors.black26
                        )
                    )
                ),
                child: Row(
                  children: [
                    //Color(0xffF1C40F)
                    const Icon(Icons.location_on,color: Colors.black26,size: 20),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          p.address,
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
            onTap: (){
              Navigator.pop(context,p);
            },
          )
        );
      });

      setState(() {
        _placesWidget = items;
      });
    }else{
      throw Exception('Failed to load place');
    }
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left,color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '검색어를 입력하세요.',
            hintStyle: TextStyle(
              color: Color(0xff848484),
              fontSize: 16,
            ),
          ),
          cursorColor: Colors.black45,
          onSubmitted: _submit,
        ),
      ),
      body: ListView(
        children: _placesWidget,
      )
    );
  }
}
