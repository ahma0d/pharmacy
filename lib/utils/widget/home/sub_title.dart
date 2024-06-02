import 'package:flutter/material.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';
class SubTitle extends StatelessWidget {
  IconData icon;
  String data;
  Color colors;
  int fontSize;
  bool visible;
  Function onTab;
  SubTitle(this.icon, this.data, this.colors, this.fontSize, this.visible,this.onTab,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: colors,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: NormalText(
                  text: data,
                  fontWeight: FontWeight.w600,
                  sizeText: fontSize.toDouble(),
                  colorText: colors,
                ),
              ),
            ],
          ),
          if (visible)
            InkWell(
              onTap: () {
                print('object');
              },
              child: Row(
                children: [
                  InkWell(
                    child: NormalText(
                      text: "See More",
                      sizeText: 12,
                      colorText: colors,
                      fontWeight: FontWeight.w900,
                    ),
                    onTap: (){
                      onTab();
                    },
                  ),
                  Icon(
                    Icons.arrow_right_sharp,
                    size: 25,
                    color: colors,
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
