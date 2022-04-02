import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:cospick/common/nextbutton.dart';
import 'package:cospick/screens/write/searchplace.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../common/appbar.dart';
import '../../common/dialog.dart';
import '../../models/galleryitem.dart';
import '../../models/item.dart';
import '../../models/place.dart';

class WriteItem extends StatefulWidget {
  const WriteItem({Key? key}) : super(key: key);
  @override
  _WriteItemState createState() => _WriteItemState();
}

class _WriteItemState extends State<WriteItem> {

  final ImagePicker _picker = ImagePicker();
  List<File> _photos = <File>[];

  final _wonController = TextEditingController();
  late Place _place;
  late Item _item;
  LatLng nowlocation = LatLng(37.5580677, 126.9985135);
  bool _visible = false;
  int _current = 0;
  List<AppBar> bar = [];
  List<Widget> Form = [];
  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];

  void _onMapCreated(NaverMapController controller) {
    _controller.complete(controller);
  }
  void getPosition() async {
    Position _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    nowlocation = LatLng(_position.latitude, _position.longitude);
  }
  void _cameraPosition(LatLng position) async {
    final controller = await _controller.future;
    controller.moveCamera(CameraUpdate.toCameraPosition(CameraPosition(
      target: position,
      zoom: 15,
    )));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getPosition();
    bar.add(MyAppBar("코스작성하기", () {
      Navigator.pop(context);
    }, true));
    bar.add(MyAppBar("코스작성하기", () {
      setState(() {
        _current--;
      });
    }, true));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Form = [
      Stack(
        children: [
          NaverMap(
            buildingHeight: MediaQuery.of(context).size.height,
            initialCameraPosition: CameraPosition(
              target: nowlocation,
              zoom: 15,
            ),
            onMapCreated: _onMapCreated,
            // onMapTap: _onMapTap,
            markers: _markers,
            initLocationTrackingMode: LocationTrackingMode.NoFollow,
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 15),
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
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "검색어를 입력하세요.",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                _place = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPlace()),
                );
                _visible = true;
                nowlocation = LatLng(_place.y, _place.x);
                _markers = [];
                _markers.add(Marker(
                  markerId: DateTime.now().toIso8601String(),
                  position: nowlocation,
                  infoWindow: _place.place_name,
                  // onMarkerTab: _onMarkerTap,
                ));
                _cameraPosition(nowlocation);
                _item = Item(_place.place_name, "", [], 0, _place);
                setState(() {});
              },
            ),
          ),
          Positioned(
            width: size.width,
            bottom: 5,
            child: Visibility(
                visible: _visible,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      padding: EdgeInsets.all(15),
                      width: size.width * 0.95,
                      height: size.height * 0.15,
                      // color: Colors.white,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 5,
                              offset: Offset(8, 8),
                            ),
                          ]),
                      child: _visible
                          ? Container(
                              child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(maxWidth: size.width*0.6),
                                      child: Text(
                                        _place.place_name,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(maxWidth: size.width*0.2),
                                      child: Text(
                                        _place.category_group_name,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(child: Container()),
                                Row(
                                  children: [
                                    Text(_place.address_name),
                                    // Expanded(child: Container(),),
                                    // Text(_place.distance + "afds"),
                                  ],
                                )
                              ],
                            ))
                          : const Text(""),
                    ),
                    Container(
                      // width: size.width,
                      alignment: Alignment.bottomCenter,
                      child: myButton("다음단계", () {
                        setState(() {
                          _current++;
                        });
                      }),
                    )
                  ],
                )),
          )
        ],
      ),
      Container(
        color: Colors.white,
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '장소 이름을 입력하세요',
                          hintStyle: TextStyle(
                            color: Colors.black, //Color(0xff848484),
                            fontSize: 16,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        cursorColor: Colors.black,
                        onChanged: (string){
                          _item.title = string;
                        },
                      ),
                      Text(
                        _visible
                            ? _place.place_name +
                                " (" +
                                _place.address_name +
                                ")"
                            : "",
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black38),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: size.height * 0.2,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _photos.length + 1,
                      itemBuilder: (context, index){
                        if(index == _photos.length){
                          return _buildAddPhoto(size);
                        }
                        File image = _photos[index];
                        return _buildImage(image, size, index);
                      },
                      // _buildAddPhoto(size)
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 200,
                    minLines: 5,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '코스 설명을 입력하세요',
                    ),
                    onChanged: (string){
                      _item.content = string;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "이용가격",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        controller: _wonController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '0원',
                        ),
                        onChanged: (cost){
                          _wonController.value = TextEditingValue(
                            text: cost.toString() + "원",
                            selection: TextSelection.collapsed(offset: cost.length),
                          );
                          _item.cost = int.parse(cost);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              // width: size.width,
              alignment: Alignment.bottomCenter,
              child: myButton("완료", () {
                Navigator.pop(context,_item);
                // Navigator.pop(context);
              }),
            )
          ],
        ),
      ),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: bar[_current],
      body: Form[_current],
    );
  }
  _buildAddPhoto(size){
    return InkWell(
      child: Container(
        width: (size.width - 30 - 20) / 3,
        // height: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xffe7e7e7),
            width: 0.50,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 0.5,
              offset: Offset(0, 2),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/plus-circle.png",
                width: 20, height: 20),
            const Text(
              "사진 선택",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffbbbbbb),
                fontSize: 10,
                fontFamily: "Spoqa Han Sans Neo",
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
      onTap: () => _onAddPhotoClicked(context),
    );
  }
  _buildImage(image, size, index){
    return Container(
      child: Stack(
        children: [
          Container(
            width: (size.width - 30 - 20) / 3,
            // height: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xffe7e7e7),
                width: 0.50,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 0.5,
                  offset: Offset(0, 2),
                ),
              ],
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child:  Image.file(image,fit: BoxFit.cover,width: (size.width - 30 - 20) / 3,height: size.height * 0.2,),
            ),
          ),
          Positioned(
              top: 5,
              right: 5,
              child: InkWell(
                child: const Icon(Icons.cancel,color: Color(0xffF1C40F),size: 20,),
                onTap: (){
                  _item.img.removeAt(index);
                  _photos.removeAt(index);
                  setState(() {});
                },
              )
          ),
        ],
      ),
      margin: const EdgeInsets.only(right: 5),
    );
  }

  _onAddPhotoClicked(context) async {
    Permission permission;

    if (Platform.isIOS) {
      permission = Permission.photos;
    } else {
      permission = Permission.storage;
    }

    PermissionStatus permissionStatus = await permission.status;

    print(permissionStatus);

    if (permissionStatus == PermissionStatus.restricted) {
      _showOpenAppSettingsDialog(context);

      permissionStatus = await permission.status;

      if (permissionStatus != PermissionStatus.granted) {
        //Only continue if permission granted
        return;
      }
    }

    if (permissionStatus == PermissionStatus.permanentlyDenied) {
      _showOpenAppSettingsDialog(context);

      permissionStatus = await permission.status;

      if (permissionStatus != PermissionStatus.granted) {
        //Only continue if permission granted
        return;
      }
    }

    if (permissionStatus == PermissionStatus.denied) {
      if (Platform.isIOS) {
        _showOpenAppSettingsDialog(context);
      } else {
        permissionStatus = await permission.request();
        if (permissionStatus == PermissionStatus.permanentlyDenied) {
          _showOpenAppSettingsDialog(context);

          permissionStatus = await permission.status;

          if (permissionStatus != PermissionStatus.granted) {
            //Only continue if permission granted
            return;
          }
        }
      }

      if (permissionStatus != PermissionStatus.granted) {
        //Only continue if permission granted
        return;
      }
    }

    if (permissionStatus == PermissionStatus.granted) {
      print('Permission granted');

      final XFile? xFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (xFile != null) {
        final File image = File(xFile.path);
        // String fileExtension = path.extension(image.path);

        // _galleryItems.add(
        //   GalleryItem(
        //     id: Uuid().v1(),
        //     resource: image.path,
        //     isSvg: fileExtension.toLowerCase() == ".svg",
        //   ),
        // );
        setState(() {
          _photos.add(image);
        });
        _item.img.add(image.path);
      }
    }
  }

  _showOpenAppSettingsDialog(context) {

    return CustomDialog.show(
      context,
      '권한이 필요해요.',
      '사진을 선택하기 위해 권한이 필해요.',
      '설정 열기',
      openAppSettings,
    );
  }
}
