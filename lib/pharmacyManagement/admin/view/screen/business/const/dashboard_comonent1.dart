import 'package:flutter/material.dart';

import '../../../../../../utils/widget/all_app/text_normal.dart';

class QuikeReportsComponents extends StatelessWidget {
  Size size;
  Color circleColor;
  IconData iconData;
  String title;
  String title2;
  String title3;

  QuikeReportsComponents(this.size, this.circleColor, this.iconData, this.title,
      this.title2, this.title3);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: size.width / 30, right: size.width / 30, top: size.height / 70),
      padding: EdgeInsets.symmetric(
          horizontal: size.width / 30, vertical: size.height / 80),
      height: size.height / 8,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurStyle: BlurStyle.outer,
                blurRadius: 4,offset: Offset(.4,.5)
            )
          ],
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height / 15,
                width: size.height / 15,
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: circleColor,
                    borderRadius: BorderRadius.circular(40)),
                child: Icon(
                  iconData,
                  size: 33,
                  color: Colors.white,
                ),
              ),
              NormalText(text: title),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 27, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NormalText(
                  text: title2,
                  sizeText: 32,
                  colorText: circleColor,
                  maxLine: 1,
                  fontWeight: FontWeight.w500,
                ),
                Icon(Icons.compare_arrows)
              ],
            ),
          )
        ],
      ),
    );
  }
}
class RejectAcsseptomponents extends StatelessWidget {
  Color circleColor;
  String title;
  String title2;

  RejectAcsseptomponents(this.circleColor, this.title, this.title2);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(
          left: size.width / 30, right: size.width / 30, top: size.height / 70),
      width: size.width,
      height: size.height / 8,
      decoration: BoxDecoration(
          color: circleColor, borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.only(top: 14),
        alignment: Alignment.center,
        height: size.height / 8.8,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                maxLines: 1,
                style: TextStyle(
                    color: circleColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 30)),
            Text(title2,
                maxLines: 1,
                style: TextStyle(
                    color: circleColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
class MySpacer extends StatelessWidget {
  Size size;
   MySpacer({required this.size}) ;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 20),
      height: 1.6,
      width: size.width,
      color: Colors.grey.shade300,
    );
  }
}


