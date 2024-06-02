import 'package:flutter/material.dart';

import 'const.dart';




class MaretingComponent extends StatelessWidget {
  String? t;
  Color? color1;
  String ?text;
  IconData ?icon;


  MaretingComponent({this.t, this.color1, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 20,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(t!,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(text!,
                        style: TextStyle(
                            color: color1,
                            fontWeight: FontWeight.w500,
                            fontSize: 14)),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 14,
            child: Container(
              child: Icon(
                icon,
                color: Colors.white,
                size: 26,
              ),
              height: 32,
              width: 27,
              decoration: BoxDecoration(
                  color: color1, borderRadius: BorderRadius.circular(4)),
            ),
          )
        ],
      ),
    );
  }
}

class QuickReportsComponent extends StatelessWidget {
  String? content,Title;
  Color? color1;int index;
  String ?text;
  IconData ?icon;


  QuickReportsComponent(
      this.content, this.Title, this.color1, this.index, this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, top: 10),
      height: 90,
      width: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [colors[index], colors[index + 1]],
            stops: [0.4, 5],
          )),
      child: Padding(
        padding: EdgeInsets.only(
          left: 10,
          top: 10,
          right: 3,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 36,
                )),
            SizedBox(
              width: 20,
            ),
            Container(
              padding:
              EdgeInsets.only( top: 10, right: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Title!,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(content!,
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w500,
                          fontSize: 14)),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}

