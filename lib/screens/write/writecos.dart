import 'package:cospick/common/appbar.dart';
import 'package:cospick/common/nextbutton.dart';
import 'package:cospick/common/select_cosmate.dart';
import 'package:cospick/screens/write/stepwidget.dart';
import 'package:cospick/screens/write/writelist.dart';
import 'package:flutter/material.dart';

class WriteCos extends StatefulWidget {
  const WriteCos({Key? key}) : super(key: key);

  @override
  _WriteCosState createState() => _WriteCosState();
}

class _WriteCosState extends State<WriteCos> {
  SelectCosmate select = SelectCosmate();
  WriteList itemList = WriteList();

  int currentStep = 0;
  late List<Widget> form;
  late Widget nextbutton;

  onStepContinue() {
    if(currentStep == 0 && !select.isSelected()) return;
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
  submitCos(){
    select = SelectCosmate();
    itemList = WriteList();
    currentStep = 0;
    setState(() {

    });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    nextbutton = myButton("다음단계", onStepContinue);
  }

  @override
  Widget build(BuildContext context) {
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
                )
            ),
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
              children: [
                vector1On,
                bar12On,
                vector2On,
                barOff,
                vector3Off
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
            children: [
              vector1On,
              bar12On,
              vector2On,
              bar23On,
              vector3On
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
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),

          Expanded(child: Container(child: myButton("완료", submitCos),alignment: Alignment.bottomCenter,)),
        ],
      ),
    ];
    return Scaffold(
      appBar: MyAppBar("코스 작성하기", onStepCancel,true),
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 5),
        child: form[currentStep],
      ),
    );
  }
}
