import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class PostMiddleScreen extends StatelessWidget {
  const PostMiddleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.blueGray400,
      child: Flex(
        direction: context.isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          "Education\n".richText.xl4.white.make(),
          Expanded(
            child: VxSwiper(
              items: [
                RaisedButton(
                  color: Color(0xFF94A3B8),
                  onPressed: () {
                    launch(
                        "https://www.stjosephstechnology.ac.in/web/index.html");
                  },
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text(
                              "St. Joseph's Institute of Technology,Chennai\nComputer Science and Engineering\n(2019-2023)",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 0.5,
                ),
                RaisedButton(
                  color: Color(0xFF94A3B8),
                  onPressed: () {
                    launch(
                        "https://schoolconnects.in/schools/rosary-matriculation-higher-secondary-school-mylapore-123-admission");
                  },
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text(
                              "Rosary Matriculation Higher Secondary School,Chennai\nHigher Secondary Education\n(2017-2019)",
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 0.5,
                ),
                RaisedButton(
                  color: Color(0xFF94A3B8),
                  onPressed: () {
                    launch(
                        "https://schoolconnects.in/schools/rosary-matriculation-higher-secondary-school-mylapore-123-admission");
                  },
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text(
                              "Rosary Matriculation Higher Secondary School,Chennai\nSecondary Education\n(2012-2017)",
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 0.5,
                ),
              ],
              height: 300,
              enlargeCenterPage: true,
              viewportFraction: context.isMobile ? 0.75 : 0.5,
              autoPlay: true,
              autoPlayAnimationDuration: 1.seconds,
            ),
          ),
        ],
      ).p64().h(context.isMobile ? 500 : 300),
    );
  }
}
