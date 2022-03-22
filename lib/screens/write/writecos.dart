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
    setState(() {
      debugPrint(currentStep.toString());
      currentStep++;
    });
  }

  onStepCancel() {
    setState(() {
      debugPrint(currentStep.toString());
      if (currentStep > 0) {
        currentStep -= 1;
      }
    });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    double btnWidth = 360;
    if (MediaQuery.of(context).size.width < 400) {
      btnWidth = MediaQuery.of(context).size.width - 50;
    }
    nextbutton = myButton("다음단계", onStepContinue);
    form = [
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
          nextbutton,
          const SizedBox(height: 10),
        ],
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("코스 작성하기", onStepCancel,true),
      body: form[currentStep],
    );
  }
}
