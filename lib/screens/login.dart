

import 'package:cospick/common/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kakao_flutter_sdk/all.dart';


class Mylogin extends StatelessWidget {
  const Mylogin({Key? key}) : super(key: key);

  Future<void> _loginButtonPressed() async {
    String authCode = await AuthCodeClient.instance.request();
    print(authCode);
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final double btnsize = size.width * 0.95;
    return Scaffold(
      body:Container(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
              width: 100,
            ),
            SvgPicture.asset(
              'assets/characters.svg',
              width: 81,
              height: 40,
            ),
            const SizedBox(
              height: 12,
              width: 100,
            ),
            const Text(
              "COSPICK",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "Spoqa Han Sans Neo",
                fontWeight: FontWeight.w700,
                letterSpacing: 11.16,
              ),
            ),
            const SizedBox(
              height: 93,
              width: 100,
            ),
            Container(
              width: btnsize,
              height: 44,
              decoration: const BoxDecoration(
                boxShadow: [

                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 24,
                    offset: Offset(0, 8),
                  )
                ],
              ),
              child: ElevatedButton(onPressed: _loginButtonPressed,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => const Color(0xfffee500)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)
                        )
                    )
                ),

                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/kakaologo.svg',
                      width: 15.84,
                      height: 14.64,
                    ),
                    Container(
                      width: btnsize,
                      child: const Text(
                        "Kakao Talk 계정으로 로그인",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width:10,height: 15,),
            Container(
              width: btnsize,
              height: 44,
              decoration: const BoxDecoration(
                boxShadow: [

                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 24,
                    offset: Offset(0, 8),
                  )
                ],
              ),
              child: ElevatedButton(onPressed: (){},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => const Color(0xff1877f2)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)
                        )
                    )
                ),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/facebooklogo.svg',
                      width: 15.84,
                      height: 14.64,
                    ),
                    Container(
                      width: btnsize,
                      child: const Text(
                        "Facebook 계정으로 로그인",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width:10,height: 15,),
            Container(
              width: btnsize,
              height: 44,
              decoration: const BoxDecoration(
                boxShadow: [

                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 24,
                    offset: Offset(0, 8),
                  )
                ],
              ),
              child: ElevatedButton(onPressed: (){},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => const Color(0xfff8f8f8)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)
                        )
                    )
                ),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/googlelogo.svg',
                      width: 15.84,
                      height: 14.64,
                    ),
                    Container(
                      width: btnsize,
                      child: const Text(
                        "Google 계정으로 로그인",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width:10,height: 15,),
            Container(
              width: btnsize,
              height: 44,
              decoration: const BoxDecoration(
                boxShadow: [

                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 24,
                    offset: Offset(0, 8),
                  )
                ],
              ),
              child: ElevatedButton(onPressed: (){},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)
                        )
                    )
                ),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/applelogo.svg',
                      width: 15.84,
                      height: 14.64,
                    ),
                    Container(
                      width: btnsize,
                      child: const Text(
                        "Apple 계정으로 로그인",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}


