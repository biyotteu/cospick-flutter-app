import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectCosmate extends StatefulWidget {
  SelectCosmate({Key? key}) : super(key: key);
  Map<String, bool> mate = {
    "all": false,
    "friend": false,
    "family": false,
    "couple": false,
    "pet": false
  };

  isSelected(){
    return (mate['all']?? false) || (mate['friend']?? false) || (mate['family']?? false) || (mate['couple']?? false) || (mate['pet']?? false);
  }
  @override
  _SelectCosmateState createState() => _SelectCosmateState();
}

class _SelectCosmateState extends State<SelectCosmate> {
  static late Container allContainerOn,
      friendContainerOn,
      familyContainerOn,
      coupleContainerOn,
      petContainerOn,
      allContainerOff,
      friendContainerOff,
      familyContainerOff,
      coupleContainerOff,
      petContainerOff;

  double cardWidth = 120;
  double cardHeight = 180;

  Widget _renderAll(){
    return (widget.mate["all"]??true) ? allContainerOn : allContainerOff;
  }
  Widget _renderFriend(){
    return (widget.mate["friend"]??true) ? friendContainerOn : friendContainerOff;
  }
  Widget _renderFamily(){
    return (widget.mate["family"]??true) ? familyContainerOn : familyContainerOff;
  }
  Widget _renderCouple(){
    return (widget.mate["couple"]??true) ? coupleContainerOn : coupleContainerOff;
  }
  Widget _renderPet(){
    return (widget.mate["pet"]??true) ? petContainerOn : petContainerOff;
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(MediaQuery.of(context).size.width < 400){
      cardWidth = (MediaQuery.of(context).size.width - 40)/3;
    }
    allContainerOff = createSelected(cardWidth,cardHeight,"모두",SvgPicture.asset(
      "assets/svg/characters/all_off.svg",
      height: cardWidth/3,
    ),false);
    friendContainerOff = createSelected(cardWidth,cardHeight,"친구",SvgPicture.asset(
      "assets/svg/characters/friend_off.svg",
      width: cardWidth*5/12,
    ),false);
    familyContainerOff = createSelected(cardWidth,cardHeight,"가족",SvgPicture.asset(
      "assets/svg/characters/family_off.svg",
      width: cardWidth/3,
    ),false);
    coupleContainerOff = createSelected(cardWidth,cardHeight,"연인",SvgPicture.asset(
      "assets/svg/characters/couple_off.svg",
      width: cardWidth*5/12,
    ),false);
    petContainerOff = createSelected(cardWidth,cardHeight,"반려동물",SvgPicture.asset(
      "assets/svg/characters/pet_off.svg",
      width: cardWidth/4,
    ),false);

    allContainerOn = createSelected(cardWidth,cardHeight,"모두",SvgPicture.asset(
      "assets/svg/characters/all.svg",
      height: cardWidth/3,
    ),true);
    friendContainerOn = createSelected(cardWidth,cardHeight,"친구",SvgPicture.asset(
      "assets/svg/characters/friend.svg",
      width: cardWidth*5/12,
    ),true);
    familyContainerOn = createSelected(cardWidth,cardHeight,"가족",SvgPicture.asset(
      "assets/svg/characters/family.svg",
      width: cardWidth/3,
    ),true);
    coupleContainerOn = createSelected(cardWidth,cardHeight,"연인",SvgPicture.asset(
      "assets/svg/characters/couple.svg",
      width: cardWidth*5/12,
    ),true);
    petContainerOn = createSelected(cardWidth,cardHeight,"반려동물",SvgPicture.asset(
      "assets/svg/characters/pet.svg",
      width: cardWidth/4,
    ),true);
  }

  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width < 400){
      cardWidth = (MediaQuery.of(context).size.width - 40)/3;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                child: _renderAll(),
                onTap: () {
                  setState(() {
                    if (widget.mate["all"] ?? true) {
                      widget.mate["all"] = false;
                    } else {
                      widget.mate["all"] = true;
                      widget.mate["friend"] = false;
                      widget.mate["family"] = false;
                      widget.mate["couple"] = false;
                      widget.mate["pet"] = false;
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                child: _renderFriend(),
                onTap: () {
                  setState(() {
                    if (widget.mate["friend"] ?? true) {
                      widget.mate["friend"] = false;
                    } else {
                      widget.mate["friend"] = true;
                      widget.mate["all"] = false;
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                child: _renderFamily(),
                onTap: () {
                  setState(() {
                    if (widget.mate["family"] ?? true) {
                      widget.mate["family"] = false;
                    } else {
                      widget.mate["family"] = true;
                      widget.mate["all"] = false;
                    }
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                child: _renderCouple(),
                onTap: () {
                  setState(() {
                    if (widget.mate["couple"] ?? true) {
                      widget.mate["couple"] = false;
                    } else {
                      widget.mate["couple"] = true;
                      widget.mate["all"] = false;
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                child: _renderPet(),
                onTap: () {
                  setState(() {
                    if (widget.mate["pet"] ?? true) {
                      widget.mate["pet"] = false;
                    } else {
                      widget.mate["pet"] = true;
                      widget.mate["all"] = false;
                    }
                  });
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  width: cardWidth,
                  height: 180,
                )),
          ],
        )
      ],
    );
  }
}

createSelected(width,height,title,svg,on) {
  Color textColor = const Color(0xffBBBBBB);
  Image check = Image.asset('assets/icons/check_circle_off.png');
  BoxDecoration box = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x19000000),
          blurRadius: 10,
          offset: Offset(0, 8),
        ),
      ],
    color: const Color(0xffBBBBBB)
     );
  if(on){
    textColor = const Color(0xff656cd2);
    check = Image.asset('assets/icons/check_circle_on.png');
    box = BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 10,
            offset: Offset(0, 8),
          ),
        ],
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFCEAD0),
              Color(0xffF1C40F),
              Color(0xffE26A6A),
              Color(0xff656CD2),
            ]));
  }
  return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: box,
      child: Container(
        width: width - 4,
        height: height - 4,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                right: 10,
                top: 8,
                child: check
            ),
            svg,
            Positioned(
              bottom: 10,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontFamily: "Spoqa Han Sans Neo",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ));
}
