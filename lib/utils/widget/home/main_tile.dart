import 'package:flutter/material.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';

import '../all_app/text_normal.dart';
class MainTitle extends StatelessWidget {
  Size size;
  String title = '';

  MainTitle({super.key, required this.size, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.filter_list_outlined,
                  size: 33,
                  color: AllColors.appColor,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              NormalText(
                text: title,
                sizeText: 34,
                colorText: AllColors.appColor,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
