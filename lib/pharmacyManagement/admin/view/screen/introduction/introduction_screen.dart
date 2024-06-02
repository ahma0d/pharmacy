import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/auth/login/login_screen.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

class IntroductionApp extends StatelessWidget {
  const IntroductionApp({Key? key}) : super(key: key);

  List<PageViewModel>getPages(){
    return [
      PageViewModel(
        image:Lottie.asset("assets/images/a1.json",height: 200,width: 200,alignment: Alignment.center,),
        title: 'Pharmacy System Application',
        body: 'Pharmacy is the science and practice of discovering, producing, preparing, dispensing, reviewing and monitoring medications, aiming to ensure the safe, effective, and affordable use of medicines. It is a miscellaneous science as it links health sciences with pharmaceutical sciences and natural sciences. The professional practice is becoming more clinically oriented as most of the drugs are now manufactured by pharmaceutical industries',
      ),
      PageViewModel(
        image:Lottie.asset("assets/images/a2.json",height: 400,),
        title: 'Services in Application ',
        body: 'The scope of pharmacy practice includes more traditional roles such as compounding and dispensing of medications. It also includes more modern services related to health care including clinical services, reviewing medications for safety and efficacy, and providing drug information.',
      ),
      PageViewModel(
        image:Lottie.asset("assets/images/a3.json"),
        title: 'Support Pharmacy Application',
        body: 'Pharmacy technicians support the work of pharmacists and other health professionals by performing a variety of pharmacy-related functions, including dispensing prescription drugs and other medical devices to patients and instructing on their use.',

      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: IntroductionScreen(
        done: NormalText(text: 'Done',),
         onDone: (){
          navigateAndFinish(context: context, screen: LoginScreen());
         },
        next: NormalText(text: 'Next >>>' , colorText: Colors.blue,),
        skip: NormalText(text: 'Skip',colorText: Colors.red,),
        onSkip: (){
          navigateAndFinish(context: context, screen: LoginScreen());
        },
        allowImplicitScrolling: true,
        pagesAxis: Axis.horizontal,
        showSkipButton: true,
        pages: getPages(),
        globalBackgroundColor: Colors.white,
      ),
    );
  }
}
