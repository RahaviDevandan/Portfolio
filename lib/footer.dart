import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_profile/coolers.dart';
import 'package:my_profile/header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        VxDevice(
          mobile: VStack(
            [
              "Contact\nLet's get in touch and build something together :)"
                  .text
                  .center
                  .white
                  .xl2
                  .make(),
              10.heightBox,
              "rahavidevandan@gmail.com"
                  .text
                  .white
                  .semiBold
                  .make()
                  .box
                  .border(color: Colors.white)
                  .p16
                  .rounded
                  .make()
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
          web: HStack(
            [
              "Contact\nLet's get in touch and build something together :)"
                  .text
                  .center
                  .white
                  .xl2
                  .make(),
              10.widthBox,
              "rahavidevandan@gmail.com"
                  .text
                  .white
                  .semiBold
                  .make()
                  .box
                  .border(color: Colors.white)
                  .p16
                  .rounded
                  .make()
            ],
            alignment: MainAxisAlignment.spaceAround,
          ).w(context.safePercentWidth * 70).scale150().p16(),
        ),
        50.heightBox,
        SocialAccounts().shimmer(),
        20.heightBox,
        CustomAppBar().shimmer(),
        10.heightBox,
        "Thanks for Scrolling. ".richText.semiBold.white.withTextSpanChildren(
            ["that's all for now".textSpan.black.make()]).make(),
        10.heightBox,
        [
          "Thanks for your visit".text.red500.make().shimmer(),
          10.widthBox,
          Icon(
            AntDesign.heart,
            color: Vx.red500,
            size: 14,
          )
        ].hStack(crossAlignment: CrossAxisAlignment.center),
      ],
      crossAlignment: CrossAxisAlignment.center,
    ).wFull(context).p16();
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

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.codesquare,
      size: 50,
      color: Colors.black,
    );
  }
}
