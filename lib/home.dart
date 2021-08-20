import 'package:flutter/material.dart';
import 'package:my_profile/blog.dart';
import 'package:my_profile/coolers.dart';
import 'package:my_profile/footer.dart';

import 'package:my_profile/header.dart';
import 'package:my_profile/middle.dart';
import 'package:my_profile/postmiddle.dart';

import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolers.primaryColor,
      child: VStack([
        HeaderScreen(),
        if (context.isMobile) IntroductionWidget().p16(),
        MiddleScreen(),
        PostMiddleScreen(),
        BlogScreen(),
        FooterScreen(),
      ]).scrollVertical(),
    );
  }
}
//flutter run -d chrome --no-sound-null-safety