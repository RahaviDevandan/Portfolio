import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart' show AntDesign, FlutterIcons;
import 'package:my_profile/coolers.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var makeWidget = "Rahavi\nDevandan."
        .text
        .blue100
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
              child: VStack([
        ZStack([
          PictureWidget(),
          Row(
            children: [
              VStack([
                if (context.isMobile) .50.heightBox else 10.heightBox,
                CustomAppBar().shimmer(
                  primaryColor: Coolers.accentColor,
                ),
                30.heightBox,
                makeWidget,
                20.heightBox,
                VxBox()
                    .color(Coolers.accentColor)
                    .size(60, 10)
                    .make()
                    .shimmer(primaryColor: Coolers.accentColor),
                30.heightBox,
                SocialAccounts(),
              ]).pSymmetric(h: context.percentWidth * 10, v: 32),
              Expanded(
                child: VxResponsive(
                  fallback: const Offstage(),
                  medium: IntroductionWidget()
                      .pOnly(left: 120)
                      .h(context.percentHeight * 60),
                  large: IntroductionWidget()
                      .pOnly(left: 120)
                      .h(context.percentHeight * 60),
                ),
              ),
            ],
          ).w(context.screenWidth)
        ]),
      ]))
          //.size(context.screenWidth, context.percentWidth * 80)
          .color(Coolers.secondaryColor)
          .make(),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VStack(
          [
            [
              " - Introduction".text.gray500.widest.sm.make(),
              5.heightBox,
              "Python,C,SQL,Java Programmer,Backend developer.Beginner in flutter,firebase,dart & web.B.E. Computer Science Engineering Student in St.Joseph's Institute of Technology.Interested in working on new projects."
                  .text
                  
                  .white
                  .xl3
                  .maxLines(7)
                  .make()
                  .w(context.isMobile
                      ? context.screenWidth
                      : context.percentWidth * 40),
              20.heightBox,
            ].vStack(),
            RaisedButton(
              onPressed: () {
                launch("https://github.com/RahaviDevandan");
              },
              child: "Visit my Github".text.white.make(),
              color: Coolers.accentColor,
              shape: Vx.roundedSm,
              hoverColor: Vx.blue700,
            ).h(50),
          ],
          alignment: MainAxisAlignment.spaceEvenly,
        ),
      ],
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Center(
          child: Container(
              height: 500.0,
              width: 800.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/1/work-station-straight-on-view.jpg?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'),
                    fit: BoxFit.cover),
              )),
        ));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.qrcode,
      size: 50,
      color: Coolers.accentColor,
    );
  }
}

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      Icon(AntDesign.instagram, color: Colors.white).mdClick(() {
        launch("https://www.instagram.com/rahavi1402/");
      }).make(),
      20.widthBox,
      Icon(AntDesign.github, color: Colors.white).mdClick(() {
        launch("https://github.com/RahaviDevandan");
      }).make(),
      20.widthBox,
      Icon(AntDesign.linkedin_square, color: Colors.white).mdClick(() {
        launch("https://www.linkedin.com/in/rahavi-ds-26508120b/");
      }).make(),
    ].hStack();
  }
}
