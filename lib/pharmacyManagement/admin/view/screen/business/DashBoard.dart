import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../utils/widget/all_app/text_normal.dart';
import 'charts/AreaDefault.dart';
import 'charts/SparklineAxesTypes.dart';
import 'charts/StackedColumnChart.dart';
import 'charts/profite.dart';
import 'const/const.dart';
import 'const/dashboard_comonent1.dart';
import 'const/dashboard_comonent2.dart';
import 'const/title.dart';

////////////////////////////////////////////////////
////    syncfusion_flutter_charts: ^20.1.60    /////
////    syncfusion_localizations:              /////
////      percent_indicator: ^4.2.3            /////
///       desktop_window:                      /////
///////////////////////////////////////////////////////


List strings=[
  'Reports','Company','laboratory','Primary','Drugs'
];
class Dashpoard extends StatefulWidget {
  @override
  State<Dashpoard> createState() => _DashpoardState();
}

class _DashpoardState extends State<Dashpoard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.only(top: size.height / 13),
          color: Colors.white,
          child: Container(
              child: Column(
            children: [
              MainTitle(size: size, title: "Dashboard"),
              QuikeReportsComponents(size, Colors.cyan, Icons.star_border,
                  'Drugs', '544', ''),
              QuikeReportsComponents(size, Colors.red,
                  Icons.star_half_outlined, 'Primary Drugs', '200', ''),
              QuikeReportsComponents(size, Colors.green,
                  Icons.star, 'Laboratory Drugs', '122', ''),
              MySpacer(size: size,),

              SubTitle(Icons.stacked_bar_chart_outlined, 'Reports', color, 18, true),
              Container(
                height: size.height * .33,
                child: StackedColumnChart(),
              ),
              MySpacer(size: size,),
              SubTitle(Icons.stacked_bar_chart_outlined, 'All Reports ', color,
                  18, true),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        5,
                        (index) => QuickReportsComponent(
                            "more info",strings[index],Colors.red,index*2,'ss', icons[index],)),
                  ],
                ),
              ),
              MySpacer(size: size,),

              SubTitle(Icons.shape_line, 'Average sales', color, 18, true),
              Container(
                margin: EdgeInsets.only(
                  top:2),
                height: size.height * .4,
                child: AreaDefault(),
              ),
              MySpacer(size: size,),

              SubTitle(Icons.shopping_cart_outlined, 'Percent of Archiving', color, 18,
                  true),
              Container(
                margin: EdgeInsets.only(top: 25, left: 5, right: 6),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 12),

                          width: size.width * .32,
                          child: new CircularPercentIndicator(
                            curve: Curves.easeIn,
                            addAutomaticKeepAlive: true,
                            radius: 60.0,
                            lineWidth: 12.0,
                            animation: true,
                            percent: 0.66,
                            center: new Text(
                              "Wating",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.amber),
                            ),
                            circularStrokeCap: CircularStrokeCap.square,
                            progressColor: Colors.amber,
                          ),
                        ),
                        NormalText(text:' 66%',colorText: Colors.amber,)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 12),
                          width: size.width * .32,
                          child: new CircularPercentIndicator(
                            curve: Curves.easeIn,
                            addAutomaticKeepAlive: true,
                            radius: 60.0,
                            lineWidth: 12.0,
                            animation: true,
                            percent: 0.8,
                            center: new Text(
                              "Accepted",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.green),
                            ),
                            circularStrokeCap: CircularStrokeCap.square,
                            progressColor: Colors.green,
                          ),
                        ),
                        NormalText(text:' 80%',colorText: Colors.green,)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 12),

                          width: size.width * .32,
                          child: CircularPercentIndicator(
                            curve: Curves.easeIn,
                            addAutomaticKeepAlive: true,
                            radius: 60.0,
                            lineWidth: 12.0,
                            animation: true,
                            percent: 0.6,
                            center: Text(
                              "Deleating",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.red),
                            ),
                            circularStrokeCap: CircularStrokeCap.square,
                            progressColor: Colors.red,
                          ),
                        ),
                        NormalText(text:' 60%',colorText: Colors.red,)
                      ],
                    ),
                  ],
                ),
              ),
              MySpacer(size: size,),
              SubTitle(Icons.personal_injury_sharp, 'Daily Seals', color, 18,
                  false),

              SparklineAxesTypes(),
              SubTitle(Icons.personal_injury_sharp, 'Monthly Seals', color, 18,
                  true),

              MyHomePage()
            ],
          ))),
    ));
  }

  int fontSize = 16;

}
