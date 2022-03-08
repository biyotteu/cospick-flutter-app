import 'package:kakao_flutter_sdk/all.dart';
import 'package:flutter/material.dart';

class KakaoLogin extends StatefulWidget {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  State<KakaoLogin> createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {
  bool _isKakaoTalkInstalled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  _initKakaoTalkInstalled() async{
    final installed = await isKakaoTalkInstalled();
    setState(() {
      _isKakaoTalkInstalled = installed;
    });
  }

  Future<void> _issueAccessToken(String authCode) async{
    debugPrint(authCode);
    try{
      var token = await AuthApi.instance.issueAccessToken(authCode);

      // TokenManager.instance.setToken(token);
    }catch(error){
      debugPrint("err_accesstoken:"+error.toString());
    }
  }

  void _loginWithKakao_yes() async{
    try{
      var code = await AuthCodeClient.instance.requestWithTalk();
      await _issueAccessToken(code);
    }catch(error){
      debugPrint("err_yes:" + error.toString());
    }
  }

  void _loginWithKakao_no() async {
    try{
      var code = await AuthCodeClient.instance.request();
      await _issueAccessToken(code);
    }catch(error){
      debugPrint("err_no:"+error.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
