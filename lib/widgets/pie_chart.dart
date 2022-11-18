import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartMaker extends StatefulWidget {
  const PieChartMaker({Key? key}) : super(key: key);

  @override
  State<PieChartMaker> createState() => _PieChartMakerState();
}

class _PieChartMakerState extends State<PieChartMaker> {
  String displayInstitute ="";
  String year="";
  String valueInstitute = "";
  int touchedIndex= -1;
  Color textColor = Colors.red; //textColor for data display

  List<String> yearReceived = [
    "2021-22","2020-21","2019 -20","2018-19","2017-18"
  ];

  List<String> numInstitute =[
    "24234","2124","9119","112","123445"
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       PieChart(
          PieChartData(
            pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse){
              setState(() {
                if(!event.isInterestedForInteractions ||
                pieTouchResponse == null ||
                pieTouchResponse.touchedSection == null){
                  touchedIndex = -1;
                  return;
                }
                touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                year = yearReceived[touchedIndex];
                displayInstitute = "Institute";
                valueInstitute = numInstitute[touchedIndex];

              });
            }),
            borderData: FlBorderData(show: false,),
              sectionsSpace: 0,
              centerSpaceRadius: 90,
            sections: showingSections()
          ),
        ),
        Padding( //for elevated circle
          padding: const EdgeInsets.fromLTRB(82, 80, 80, 80),
          child: Material(
            elevation: 130,
            //shadowColor: Colors.red,
            shape: const CircleBorder(side: BorderSide.none),
            child: Container(
              //color: Colors.red,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            Center(
                child: Text(
                    displayInstitute,
                  style: TextStyle(color: textColor,fontSize: 30,fontWeight: FontWeight.bold),
                )
            ),
            const SizedBox(height: 10,),
            Center(
              child: Text(
                year,
                style: TextStyle(color: textColor,fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10,),
            Center(
              child: Text(
                valueInstitute,
                style: TextStyle(color: textColor,fontSize: 26,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }

  List<PieChartSectionData> showingSections() {

    return List.generate(5, (i) {
      //final showYear = yearReceived[i];  //for displaying title on pie chart surface
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 95.0 : 80.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            //value: 40,
            showTitle: false,
            //title: showYear,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            //value: 30,
            //title: showYear,
            showTitle: false,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            //value: 15,
            //title: showYear,
            showTitle: false,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            //value: 15,
            //title: showYear,
            showTitle: false,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            //value: 15,
            //title: showYear,
            showTitle: false,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}



