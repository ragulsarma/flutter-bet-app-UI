import 'package:bet_app/common/match_card_widget.dart';
import 'package:bet_app/common/size_config.dart';
import 'package:bet_app/style/colors.dart';
import 'package:bet_app/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Created by Ragul nathan.
/// ragulsarma@gmail.com
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: AppColors.primary,
          appBar: AppBar(
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
                      text: 'E',
                      style: new TextStyle(color: AppColors.secondary)),
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
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.secondary,
              unselectedLabelColor: Colors.white,
              tabs: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.height_2,
                      horizontal: SizeConfig.width_1_3),
                  child: Text(
                    'HOME',
                    style: TextStyle(color: AppColors.secondary),
                  ),
                ),
                Text('CRICKET'),
                Text('SOCCER'),
                Text(
                  'TENNIS',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              homeWidget(),
              Container(),
              Container(),
              Container(),
            ],
          )),
    );
  }

  Widget homeWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.width_7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CRICKET',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                MatchCardWidget(
                    team1Img: AppStrings.india_flag,
                    team1Name: 'INDIA',
                    team2Img: AppStrings.australia_flag,
                    team2Name: 'AUSTRALIA'),
                MatchCardWidget(
                    team1Img: AppStrings.csk_logo,
                    team1Name: 'CSK',
                    team2Img: AppStrings.dc_logo,
                    team2Name: 'Delhi Capitals'),
                SizedBox(
                  height: SizeConfig.height_1_5,
                ),
                Text(
                  'SOCCER',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1),
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
        ),
      ),
    );
  }
}
