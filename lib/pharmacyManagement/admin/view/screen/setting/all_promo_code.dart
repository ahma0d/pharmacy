import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/fucntion/navigate.dart';
import '../../../../../utils/widget/all_app/icon_button.dart';
import '../business/const/const.dart';
Color bgcolor=Color(0xffeff5fd);

class AllPromoCode extends StatelessWidget {
  const AllPromoCode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: color,onPressed: () {  },child: Icon(Icons.add),),
      appBar: AppBar(backgroundColor: color,title: Text('Promo Code'),
        leading: DefaultIconButton(
          iconData: Icons.arrow_back_ios_new_outlined,
          onPressed: () {
            navigateBack(context: context);
          },
        ), ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: size.width*.04,top:size.height*.022),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  width: size.width * .9,
                  child: Expandable(
                    arrowWidget: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 33,
                      color: color,
                    ),
                    firstChild: Container(
                        height: size.height*.09,

                        width: size.width * .8,
                        color: Colors.white,
                        child: Row(children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: columnColors[0],
                              shape: OvalBorder(),
                            ),
                            child: Icon(
                              Icons.star,
                              size: 33,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15, top: 9),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Discount1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 12,),
                                Text(
                                  '#943881823',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])),
                    secondChild: Container(
                      width: size.width,
                      child: Column(
                        children: [
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'type',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'persentage',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Max Discount',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '12',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Start Time',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '2023/3/3',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'End Time',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '2023/7/3',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discription',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'discount...',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  width: size.width * .9,
                  child: Expandable(
                    arrowWidget: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 33,
                      color: color,
                    ),
                    firstChild: Container(
                        height: size.height*.09,

                        width: size.width * .8,
                        color: Colors.white,
                        child: Row(children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: columnColors[2],
                              shape: OvalBorder(),
                            ),
                            child: Icon(
                              Icons.star,
                              size: 33,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15, top: 9),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Discount2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 12,),
                                Text(
                                  '#943881823',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])),
                    secondChild: Container(
                      width: size.width,
                      child: Column(
                        children: [
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'type',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'persentage',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Max Discount',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '12',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Start Time',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '2023/3/3',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'End Time',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '2023/7/3',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discription',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'discount...',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  width: size.width * .9,
                  child: Expandable(
                    arrowWidget: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 33,
                      color: color,
                    ),
                    firstChild: Container(
                        height: size.height*.09,

                        width: size.width * .8,
                        color: Colors.white,
                        child: Row(children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: columnColors[4],
                              shape: OvalBorder(),
                            ),
                            child: Icon(
                              Icons.star,
                              size: 33,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15, top: 9),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Discount3',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 12,),
                                Text(
                                  '#943881823',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])),
                    secondChild: Container(
                      width: size.width,
                      child: Column(
                        children: [
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'type',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'persentage',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Max Discount',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '12',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Start Time',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '2023/3/3',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'End Time',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '2023/7/3',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discription',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'discount...',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  width: size.width * .9,
                  child: Expandable(
                    arrowWidget: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 33,
                      color: color,
                    ),
                    firstChild: Container(
                        height: size.height*.09,

                        width: size.width * .8,
                        color: Colors.white,
                        child: Row(children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: columnColors[5],
                              shape: OvalBorder(),
                            ),
                            child: Icon(
                              Icons.star,
                              size: 33,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15, top: 9),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Discount4',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 12,),
                                Text(
                                  '#943881823',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])),
                    secondChild: Container(
                      width: size.width,
                      child: Column(
                        children: [
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'type',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'persentage',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Max Discount',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '12',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Start Time',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '2023/3/3',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'End Time',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '2023/7/3',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            color: bgcolor,
                            height: 50,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discription',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'discount...',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
