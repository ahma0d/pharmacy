import 'package:flutter/material.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

class ProfileBottom extends StatelessWidget {
  final IconData icon;
  final String text ;
  final Function onPressed ;

  const ProfileBottom({super.key, required this.icon, required this.text ,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.red,
      highlightColor: Colors.transparent,
      onTap: (){
        onPressed();
      },
      child: Container(
      padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(top: 10.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey,),
            const SizedBox(width: 20.0,),
            NormalText(text: text , fontWeight: FontWeight.w600,),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded , color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}
