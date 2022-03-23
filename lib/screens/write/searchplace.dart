import 'dart:convert';

import 'package:cospick/common/place.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class SearchPlace extends StatefulWidget {
  const SearchPlace({Key? key}) : super(key: key);

  @override
  State<SearchPlace> createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  List<Widget> _placesWidget = [];
  void _submit(String text) async{
    Position _position;
    var query = "https://dapi.kakao.com/v2/local/search/keyword.json?query="+text;
    try{
      _position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      query = query + "&x=" + _position.longitude.toString() + "&y=" + _position.latitude.toString();
    }catch(e){
      debugPrint(e.toString());
    }
    debugPrint(query);
    debugPrint("!!!!!!!!!!!!!!");
    final res = await http.get(
        Uri.parse(query),
        headers: {"Authorization":"KakaoAK e29f627b9e9dc99381e0b7cd359c1605"}
    );

    if(res.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(res.body);
      List<Widget> items = [];
      json['documents'].forEach((cur){
        Place p = Place.fromJson(cur);
        p.place_name = p.place_name.replaceAll("<b>", "").replaceAll("</b>", "");
        items.add(
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 5,right: 5,bottom: 5),

                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.4,
                            color: Colors.black26
                        ),
                    ),
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
                          p.place_name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 3,),
                        Text(
                          p.address_name,
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
      body: Container(
        margin: EdgeInsets.only(top: 5),
        child: ListView(
          children: _placesWidget,
        ),
      )
    );
  }
}
