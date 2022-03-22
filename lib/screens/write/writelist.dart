import 'package:cospick/screens/write/searchplace.dart';
import 'package:cospick/screens/write/writeitem.dart';
import 'package:flutter/material.dart';

class WriteList extends StatefulWidget {
  WriteList({Key? key}) : super(key: key);

  @override
  _WriteListState createState() => _WriteListState();
}

class _WriteListState extends State<WriteList> {
  List<Widget> itemlist = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    itemlist.add(
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
                    blurRadius: 10,
                    offset: Offset(0, 8),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/plus-circle.png",width: 20,height: 20),
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
            onTap: () {
              Navigator.push(
                context,
                // MaterialPageRoute(builder: (context) => WriteItem()),
                MaterialPageRoute(builder: (context) => WriteItem()),
              );
            },
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: itemlist,
    );
  }
}
