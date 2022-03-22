import 'dart:async';

import 'package:cospick/common/nextbutton.dart';
import 'package:cospick/screens/write/searchplace.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import '../../common/appbar.dart';
import '../../common/place.dart';

class WriteItem extends StatefulWidget {
  const WriteItem({Key? key}) : super(key: key);

  @override
  _WriteItemState createState() => _WriteItemState();
}

class _WriteItemState extends State<WriteItem> {
  late Place place;
  int _current = 0;
  List<AppBar> bar = [];
  List<Widget> Form = [];
  Completer<NaverMapController> _controller = Completer();

  void _onMapCreated(NaverMapController controller) {
    _controller.complete(controller);
  }

  void _onMapTap(LatLng latLng) {}
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Size size = MediaQuery.of(context).size;
    bar.add(
        MyAppBar("코스작성하기", () {
          Navigator.pop(context);
        },true)
    );
    bar.add(
        MyAppBar("코스작성하기", () {
          setState(() {
            _current--;
          });
        },true)
    );
    Form.add(
      Stack(
        children: [
          NaverMap(
            buildingHeight: MediaQuery.of(context).size.height,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.566570, 126.978442),
              zoom: 15,
            ),
            onMapCreated: _onMapCreated,
            // onMapTap: _onMapTap,
            //markers: _markers,
            initLocationTrackingMode:
            LocationTrackingMode.NoFollow,
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 15),
            child: InkWell(
              child: Container(
                alignment: Alignment.centerLeft,
                height: 45,
                width: size.width * 0.9,
                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1, color: Colors.black12)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/icons/icon_search.png"),
                    SizedBox(width: 10,),
                    const Text("검색어를 입력하세요."),
                  ],
                ),
              ),
              onTap: () async {
                place = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPlace()),
                );
                debugPrint(place.title);
                debugPrint("!!!!!!!!!!!!!!!!!");
              },
            ),
          ),

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
      // resizeToAvoidBottomInset : false,
      appBar: bar[_current],
      body: Form[_current],
    );
  }
}
