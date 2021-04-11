import 'package:bet_app/screens/home_page.dart';
import 'package:bet_app/style/colors.dart';
import 'package:bet_app/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: AppStrings.appName,
              home: HomePage(),
              debugShowCheckedModeBanner: false,
              theme:
                  ThemeData.light().copyWith(primaryColor: AppColors.primary),
            );
          },
        );
      },
    );
  }
}
