import 'package:cospick/common/appbar.dart';
import 'package:cospick/common/nextbutton.dart';
import 'package:cospick/common/select_cosmate.dart';
import 'package:cospick/screens/write/stepwidget.dart';
import 'package:cospick/screens/write/writelist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WriteCos extends StatefulWidget {
  const WriteCos({Key? key}) : super(key: key);

  @override
  _WriteCosState createState() => _WriteCosState();
}

class _WriteCosState extends State<WriteCos> {
  SelectCosmate select = SelectCosmate();
  WriteList itemList = WriteList();
  List<String> _tags = <String>[];
  int currentStep = 0;
  late List<Widget> form;
  late Widget nextbutton;

  final _tagController = TextEditingController();

  onStepContinue() {
    if (currentStep == 0 && !select.isSelected()) return;
    setState(() {
      currentStep++;
    });
  }

  onStepCancel() {
    setState(() {
      if (currentStep > 0) {
        currentStep -= 1;
      }
    });
  }

  submitCos() {
    onStepContinue();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    nextbutton = myButton("다음단계", onStepContinue);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double btnWidth = 360;
    if (MediaQuery.of(context).size.width < 400) {
      btnWidth = MediaQuery.of(context).size.width - 50;
    }

    form = [
      Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                vector1On,
                barOff,
                vector2Off,
                barOff,
                vector3Off,
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: btnWidth + 10,
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "코스 메이트 설정",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: "Spoqa Han Sans Neo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "누구와 갔던 코스였나요?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            select,
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              child: nextbutton,
            )),
          ],
        ),
      ),
      Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [vector1On, bar12On, vector2On, barOff, vector3Off],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: btnWidth + 10,
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "코스 입력",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: "Spoqa Han Sans Neo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "어느 장소, 어느 순서로 코스를 작성하시고 싶으신가요?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Expanded(child: itemList),
            nextbutton,
          ],
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [vector1On, bar12On, vector2On, bar23On, vector3On],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: btnWidth + 10,
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "태그 입력",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: "Spoqa Han Sans Neo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "#태그를 입력해주세요. (최대 10개)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.only(left: 12, right: 12),
              height: size.height * 0.25,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black38)),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(children: [
                        ..._tags
                            .asMap()
                            .entries
                            .map((tag) => Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 10),
                                      child: Text(
                                        "#" + tag.value,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff020202),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        right: -18,
                                        top: -10,
                                        child: IconButton(
                                          onPressed: () {
                                            _tags.removeAt(tag.key);
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Color(0xffbbbbbb),
                                            size: 14,
                                          ),
                                        ))
                                  ],
                                ))
                            .toSet()
                            .toList(),
                        IntrinsicWidth(
                          child: TextField(
                            controller: _tagController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '#태그',
                              hintStyle: TextStyle(
                                color: Color(0xffbbbbbb), //Color(0xff848484),
                                fontSize: 18,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.only(
                                  top: 6.5, bottom: 0, right: 0, left: 0),
                            ),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            cursorColor: Colors.black,
                            onSubmitted: (tag) {
                              _tagController.value = const TextEditingValue(
                                text: "",
                              );
                              if (tag.isNotEmpty && tag[0] != '#' ||
                                  tag.isEmpty) return;
                              _tags.add(tag.substring(1));
                              setState(() {});
                            },
                          ),
                        )
                      ]),
                    ],
                  ),
                ],
              )),
          Expanded(
              child: Container(
            child: myButton("완료", submitCos),
            alignment: Alignment.bottomCenter,
          )),
        ],
      ),
      Container(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/characters.svg',
                  width: size.width*0.5,
                  // height: size.height*0.18,
                ),
                const SizedBox(
                  height: 12,
                  width: double.infinity,
                ),
                Container(
                  width: size.width*0.7,
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child:  Text(
                      "코스 작성이 완료되었습니다.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        // fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: myButton("새로운 코스 작성하기", () {
                select = SelectCosmate();
                itemList = WriteList();
                _tags = [];
                currentStep = 0;
                setState(() {});
              }),
            )
          ],
        ),
      )
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar("코스 작성하기", onStepCancel, true),
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 5),
        child: form[currentStep],
      ),
    );
  }
}
