import 'package:flutter/material.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/icon_button.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

import '../../../../../utils/widget/all_app/basic_bottom.dart';
import '../business/const/const.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.white),
        ),
        leading: DefaultIconButton(
          iconData: Icons.arrow_back_ios_new_outlined,
          onPressed: () {
            navigateBack(context: context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                height: size.height * .17,
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: color,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(15.0),
                margin: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      height: size.width * .27,
                      width: size.width * .27,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/m6.jpg')),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    Container(
                      height: size.width * .27,
                      width: size.width * .3,
                      padding: EdgeInsets.only(bottom: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NormalText(
                            text: 'products na',
                            fontWeight: FontWeight.w500,
                            sizeText: 19,
                            maxLine: 1,
                          ),
                          NormalText(
                            text: 'drugs drink ',
                            fontWeight: FontWeight.w600,
                            colorText: Colors.grey,
                          ),
                          NormalText(
                            text: '120\$ ',
                            fontWeight: FontWeight.w600,
                            colorText: color,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                          size: 22,
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 7),
                                alignment: Alignment.center,
                                height: 27,
                                width: 27,
                                decoration: BoxDecoration(
                                    color: color,
                                    boxShadow: [
                                      BoxShadow(
                                          color: color, offset: Offset(.4, .4))
                                    ],
                                    borderRadius: BorderRadius.circular(8)),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                              onDoubleTap: () {},
                            ),
                            NormalText(
                              text: '12',
                              fontWeight: FontWeight.w600,
                              colorText: Colors.black87,
                            ),
                            InkWell(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 7),
                                padding: EdgeInsets.only(bottom: 21),
                                alignment: Alignment.topCenter,
                                height: 27,
                                width: 27,
                                decoration: BoxDecoration(
                                    color: color,
                                    boxShadow: [
                                      BoxShadow(
                                          color: color, offset: Offset(.4, .4))
                                    ],
                                    borderRadius: BorderRadius.circular(8)),
                                child: Icon(
                                  Icons.minimize_rounded,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                              onDoubleTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: 5,
            ),
            const SizedBox(
              height: 10.0,
            ),
            BasicBottom(
              text: 'Buy Now',
              colorText: Colors.white,
              onPressed: () {},
              fontWeight: FontWeight.bold,
              sizeText: 20.0,
              width: size.width * .95,
            )
          ],
        ),
      ),
    );
  }
}
