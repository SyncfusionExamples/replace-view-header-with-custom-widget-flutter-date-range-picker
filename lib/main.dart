import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(CustomViewHeader());

class CustomViewHeader extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewHeaderCustomization(),
    );
  }
}

class ViewHeaderCustomization extends StatefulWidget {
  @override
  _ViewHeaderCustomizationState createState() =>
      _ViewHeaderCustomizationState();
}

List<String> _days = <String>['S', 'M', 'T', 'W', 'T', 'F', 'S'];
List<Icon> _icons = <Icon>[
  Icon(
    Icons.ac_unit,
    color: Colors.black,
  ),
  Icon(Icons.wb_sunny, color: Colors.amber),
  Icon(
    Icons.wb_incandescent,
    color: Color(0xFF0ba0000),
  ),
  Icon(Icons.wb_auto, color: Colors.orange),
  Icon(Icons.wb_cloudy, color: Colors.grey),
  Icon(Icons.wb_sunny, color: Colors.amber),
  Icon(
    Icons.wb_incandescent,
    color: Color(0xFF0ba0000),
  )
];

class _ViewHeaderCustomizationState extends State<ViewHeaderCustomization> {
  double _width, _cellWidth;

  @override
  void initState() {
    _width = 0.0;
    _cellWidth = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _cellWidth = _width / 9;

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          ListView.builder(
              padding: const EdgeInsets.fromLTRB(40, 100, 40, 300),
              itemCount: _days.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctxt, int index) {
                return Container(
                  padding: const EdgeInsets.only(left: 15,top: 5),
                  width: _cellWidth,
                  height: 5,
                  color: Colors.lightGreen,
                  child: Text(_days[index]),
                );
              }),
          ListView.builder(
              padding: const EdgeInsets.fromLTRB(40, 120, 40, 500),
              itemCount: _icons.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctxt, int index) {
                return Container(
                  padding: const EdgeInsets.only(left: 5),
                  width: _cellWidth,
                  child: _icons[index],
                );
              }),
          Card(
            margin: const EdgeInsets.fromLTRB(40, 150, 40, 150),
            child: SfDateRangePicker(
              view: DateRangePickerView.month,
              headerHeight: 0,
              monthViewSettings:
                  DateRangePickerMonthViewSettings(viewHeaderHeight: 0),
            ),
          )
        ],
      ),
    ));
  }
}
