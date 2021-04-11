import 'package:bet_app/common/size_config.dart';
import 'package:bet_app/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Created by Ragul nathan.
/// ragulsarma@gmail.com
class MatchCardWidget extends StatelessWidget {
  final String team1Img;
  final String team1Name;
  final String team2Img;
  final String team2Name;

  const MatchCardWidget(
      {this.team1Img, this.team1Name, this.team2Img, this.team2Name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin:
          EdgeInsets.symmetric(vertical: SizeConfig.height_2, horizontal: 0),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.height_3, horizontal: SizeConfig.width_4),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: new LinearGradient(
              colors: [
                AppColors.cardInitialBg,
                AppColors.cardBg,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 15.0,
                    backgroundImage: NetworkImage(team1Img),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: SizeConfig.height_1_5,
                  ),
                  Text(
                    team1Name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    Container(
                        height: SizeConfig.height_3,
                        child: VerticalDivider(color: AppColors.secWhite)),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.height_1,
                          horizontal: SizeConfig.width_4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text(
                        'VS',
                        style: TextStyle(
                            fontSize: SizeConfig.fs_2,
                            color: AppColors.cardBg,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        height: SizeConfig.height_2,
                        child: VerticalDivider(color: AppColors.secWhite)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 15.0,
                    backgroundImage: NetworkImage(team2Img),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: SizeConfig.height_1_5,
                  ),
                  Text(team2Name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
