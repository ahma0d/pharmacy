
import 'package:flutter/material.dart';

import 'const.dart';

class MainTitle extends StatelessWidget {
  Size size;
  String title = '';

  MainTitle({required this.size, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.filter_list_outlined,
                      size: 33,
                      color: color,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(title,
                      maxLines: 1,
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w500,
                          fontSize: 34)),
                ],
              ),
            ),

          ],
        ));
  }
}

class SubTitle extends StatelessWidget {
  IconData icon;
  String data;
  Color colors;
  int fontSize;
  bool visible;

  SubTitle(this.icon, this.data, this.colors, this.fontSize, this.visible);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
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
                padding: EdgeInsets.only(left: 10),
                child: Text(data,
                    maxLines: 1,
                    style: TextStyle(
                        color: colors,
                        fontWeight: FontWeight.w600,
                        fontSize: fontSize.toDouble())),
              ),
            ],
          ),
          if (visible)
            InkWell(
              onTap: () {
                print('object');
              },
              child: Container(
                child: Row(
                  children: [


                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}