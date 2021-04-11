import 'package:bet_app/common/match_card_widget.dart';
import 'package:bet_app/common/size_config.dart';
import 'package:bet_app/style/colors.dart';
import 'package:bet_app/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

/// Created by Ragul nathan.
/// ragulsarma@gmail.com
class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  TextStyle calendarTextStyle = TextStyle(
      color: Colors.white,
      fontSize: SizeConfig.fs_2_7,
      fontWeight: FontWeight.w500);

  DateTime _currentDate = DateTime.now();

  EventList<Event> _markedDateMap = new EventList<Event>(events: {
    new DateTime(2021, 4, 19): [
      new Event(
        date: new DateTime(2021, 4, 19),
        title: 'Lorem',
      ),
      new Event(
        date: new DateTime(2021, 4, 19),
        title: 'Lorem',
      )
    ],
    new DateTime(2021, 4, 3): [
      new Event(
        date: new DateTime(2021, 4, 3),
        title: 'Lorem',
      )
    ]
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        elevation: 0,
        title: RichText(
          text: new TextSpan(
            style: TextStyle(
                fontStyle: FontStyle.italic,
                letterSpacing: 1,
                fontSize: SizeConfig.fs_03,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              new TextSpan(text: 'B'),
              new TextSpan(
                  text: 'E', style: new TextStyle(color: AppColors.secondary)),
              new TextSpan(text: 'T'),
            ],
          ),
        ),
        actions: [
          Icon(
            Icons.search_rounded,
            size: SizeConfig.imgSize_7,
            color: Colors.white70,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.width_5),
            child: CircleAvatar(
              radius: 16.0,
              backgroundImage: NetworkImage(AppStrings.women_cafe),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width_5,
                    vertical: SizeConfig.height_2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Apr 2021',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.fs_03,
                          fontWeight: FontWeight.bold),
                    ),

                    // to use this icon as calendar month next, prev button
                    // kindly check flutter_calendar_carousel lib custom header option
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: SizeConfig.width_2_5),
                          decoration: new BoxDecoration(
                            color: AppColors.secondary,
                            shape: BoxShape.circle,
                          ),
                          child:
                              Icon(Icons.chevron_left, color: Colors.white70),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                            color: AppColors.secondary,
                            shape: BoxShape.circle,
                          ),
                          child:
                              Icon(Icons.chevron_right, color: Colors.white70),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width_2,
                    vertical: SizeConfig.height_1_3),
                child: CalendarCarousel<Event>(
                  onDayPressed: (DateTime date, List<Event> events) {
                    //take an action with date and its events
                  },
                  thisMonthDayBorderColor: Colors.transparent,

                  selectedDayButtonColor: AppColors.secondary,
                  selectedDayBorderColor: AppColors.secondary,
                  selectedDayTextStyle: calendarTextStyle,

                  weekdayTextStyle: calendarTextStyle,
                  weekendTextStyle: calendarTextStyle,

                  daysTextStyle: calendarTextStyle,

                  nextDaysTextStyle: TextStyle(color: Colors.grey),
                  prevDaysTextStyle: TextStyle(color: Colors.grey),

                  weekDayFormat: WeekdayFormat.short,
                  firstDayOfWeek: 0,

                  showHeader: false,
                  isScrollable: false,
                  weekFormat: false,

                  height: SizeConfig.height_44,
                  //260.0,

                  selectedDateTime: _currentDate,
                  todayButtonColor: Colors.transparent,
                  todayBorderColor: Colors.transparent,
                  todayTextStyle: TextStyle(color: Colors.black),

                  daysHaveCircularBorder: true,
                  customGridViewPhysics: NeverScrollableScrollPhysics(),

                  markedDatesMap: _markedDateMap,
                  markedDateWidget: Container(
                    height: SizeConfig.height_0_5,
                    width: SizeConfig.width_1,
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  showHeaderButton: false,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: SizeConfig.height_3_5),
                  child: eventWidget())
            ],
          ),
        ),
      ),
    );
  }

  Widget eventWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: Column(
        children: [
          Container(
            width: SizeConfig.width_10,
            height: SizeConfig.height_0_5,
            margin: EdgeInsets.only(top: SizeConfig.height_2),
            decoration: new BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width_6, vertical: SizeConfig.height_3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MATCHES',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                SizedBox(
                  height: SizeConfig.height_1_3,
                ),
                MatchCardWidget(
                    team1Img: AppStrings.sevilla_logo,
                    team1Name: 'SEVILLA',
                    team2Img: AppStrings.roma_logo,
                    team2Name: 'ROMA'),
                MatchCardWidget(
                    team1Img: AppStrings.fc_logo,
                    team1Name: 'FC Basel',
                    team2Img: AppStrings.frankurt_logo,
                    team2Name: 'Eintracht'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
