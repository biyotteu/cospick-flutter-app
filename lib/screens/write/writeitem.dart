import 'dart:async';

import 'package:cospick/common/nextbutton.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

import '../../common/appbar.dart';

class WriteItem extends StatefulWidget {
  const WriteItem({Key? key}) : super(key: key);

  @override
  _WriteItemState createState() => _WriteItemState();
}

class _WriteItemState extends State<WriteItem> {

  Completer<NaverMapController> _controller = Completer();

  int _current = 0;
  List<AppBar> bar = [];
  void _onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
  List<Widget> Form = [];

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
          NaverMap(onMapCreated: _onMapCreated),
          Positioned(
              child: myButton("다음단계", (){}),
              bottom: 10,
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: bar[_current],
      // body: Form[_current],
      body: NaverMap(
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
