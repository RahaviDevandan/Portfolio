import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleScreen extends StatelessWidget {
  const MiddleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.blueGray400,
      child: Flex(
        direction: context.isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          "Project Work,\n"
              .richText
              .withTextSpanChildren(
                  ["Selected projects.".textSpan.yellow400.make()])
              .xl4
              .white
              .make(),
          20.widthBox,
          Expanded(
            child: VxSwiper(
              items: [
                ProjectWidget(
                  title: "Music Player\nLang:\nJava",
                ),
                ProjectWidget(
                  title: "Locator App\nLang:\nOracle DBMS",
                ),
                ProjectWidget(
                  title: "Python Based Web App\nLang:\nDjango",
                ),
                ProjectWidget(
                  title: "Feedback App\nLang:\nFlutter",
                ),
                ProjectWidget(
                  title: "Shopping App\nLang:\nFlutter",
                ),
                ProjectWidget(
                  title: "Facial Recognition System\nLang:\nML using Python",
                ),
                ProjectWidget(
                  title:
                      "Handwritten Digits Recognition System\nLang:\nML using Python",
                ),
                ProjectWidget(
                  title: "Movie Recommendation System\nLang:\nML using Python",
                ),
              ],
              height: 170,
              enlargeCenterPage: true,
              viewportFraction: context.isMobile ? 0.75 : 0.4,
              autoPlay: true,
              autoPlayAnimationDuration: 1.seconds,
            ),
          ),
        ],
      ).p64().h(context.isMobile ? 500 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String title;
  //const ProjectWidget({Key? key}) : super(key: key);
  const ProjectWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return title.text.bold.white.xl.wide.center
        .make()
        .box
        .p8
        .roundedLg
        .alignCenter
        .square(200)
        .neumorphic(color: Vx.blueGray400, elevation: 5.0, curve: VxCurve.flat)
        .make()
        .p16();
  }
}
