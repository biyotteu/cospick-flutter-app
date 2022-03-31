import 'dart:io';

import 'package:cospick/common/item.dart';
import 'package:cospick/screens/write/searchplace.dart';
import 'package:cospick/screens/write/writeitem.dart';
import 'package:flutter/material.dart';

class WriteList extends StatefulWidget {
  WriteList({Key? key}) : super(key: key);

  @override
  _WriteListState createState() => _WriteListState();
}

class _WriteListState extends State<WriteList> {
  List<Item> _itemlist = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _itemlist.length + 1,
      itemBuilder: (context, index) {
        if (index == _itemlist.length) {
          return _buildAddItem(context);
        }
        Item item = _itemlist[index];
        return _buildItem(context, item, index);
      },
    );
  }

  _buildAddItem(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: InkWell(
        child: Container(
          width: double.infinity,
          height: 90,
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
                blurRadius: 4,
                offset: Offset(2, 2),
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
                "코스를 추가해주세요.",
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
        onTap: () async {
          Item item = await Navigator.push(
            context,
            // MaterialPageRoute(builder: (context) => WriteItem()),
            MaterialPageRoute(builder: (context) => WriteItem()),
          );
          if (item == null) return;
          setState(() {
            _itemlist.add(item);
          });
        },
      ),
    );
  }

  _buildItem(context, Item item, index) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            width: size.width - 40,
            height: 90,
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
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              color: Colors.white,
            ),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: item.img.length > 0
                        ? Image.file(
                            File(item.img[0]),
                            fit: BoxFit.cover,
                            width: (size.width) * 0.3,
                            height: 75,
                          )
                        : Container(
                            width: (size.width) * 0.3,
                            height: 75,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "이미지 없음",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 15),
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          item.place.address_name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black38,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              onTap: () {},
            )),
        Positioned(
          child: IconButton(
              onPressed: () {
                _itemlist.removeAt(index);
                setState(() {});
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black38,
                size: 12,
              )),
          top: 0,
          right: 15,
        )
      ],
    );
  }
}
