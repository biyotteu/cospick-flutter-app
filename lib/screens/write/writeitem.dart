import 'dart:async';

import 'package:cospick/common/nextbutton.dart';
import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

import '../../common/appbar.dart';
import 'kakaoMap.dart';

class WriteItem extends StatefulWidget {
  const WriteItem({Key? key}) : super(key: key);

  @override
  _WriteItemState createState() => _WriteItemState();
}

class _WriteItemState extends State<WriteItem> {

  int _current = 0;
  List<AppBar> bar = [];
  List<Widget> Form = [];

  start() async{
    KakaoMapUtil util = KakaoMapUtil();
    // String url = await util.getResolvedLink(
    //     util.getKakaoMapURL(37.402056, 127.108212, name: 'Kakao 본사'));

    /// This is short form of the above comment
    String url =
    await util.getMapScreenURL(37.402056, 127.108212, name: 'Kakao 본사');

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => KakaoMapScreen(url: url)));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    bar.add(
        MyAppBar("코스작성하기", () {
          Navigator.pop(context);
        })
    );
    bar.add(
        MyAppBar("코스작성하기", () {
          setState(() {
            _current--;
          });
        })
    );
    Form.add(
      Stack(
        children: [
          Container(),
          Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: myButton("다음단계",(){
                  setState(() {
                    _current++;
                  });
                }),
              )
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar[_current],
      body: Form[_current],
    );
  }
}
