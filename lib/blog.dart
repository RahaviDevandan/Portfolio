import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/button.dart';
import 'package:my_profile/coolers.dart';
import 'package:my_profile/database_service.dart';
import 'package:my_profile/login.dart';
import 'package:my_profile/totallikes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final CollectionReference blogRef =
      FirebaseFirestore.instance.collection("Blog");
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.blueGray400,
      child: Flex(
          direction: context.isMobile ? Axis.vertical : Axis.horizontal,
          children: [
            Text(
              "Blog",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: DatabaseService().blogRef.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.connectionState == ConnectionState.active)
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data!.docs.map((doc) {
                        return blog(
                          id: doc.id,
                          Title: doc['Title'],
                          desc: doc['desc'],
                          Totallike: doc['Totallike'],
                        );
                      }).toList(),
                    );

                  return CircularProgressIndicator();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: DefaultButton(
                text: "ADD BLOG",
                press: () => popUp(context),
              ),
            ),
          ]),
    ).p64().h(context.isMobile ? 500 : 300);
  }
}

Widget blog(
    {required String id,
    required String Title,
    required String desc,
    required int Totallike}) {
  return Container(
    margin: EdgeInsets.all(20),
    height: 300,
    width: 300,
    decoration: BoxDecoration(
        color: Coolers.primaryColor,
        boxShadow: [BoxShadow(color: Colors.blueGrey, blurRadius: 10)]),
    child: Stack(
      children: [
        Positioned(
          width: 235,
          left: 30,
          top: 20,
          bottom: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Title, style: TextStyle(fontSize: 15)),
              SizedBox(height: 2),
              Text(desc, style: TextStyle(height: 1.5, fontSize: 10)),
            ],
          ),
        ),
        Positioned(
          right: 3,
          top: 10,
          child: Column(
            children: [
              Totallikes(id: id, Totallike: Totallike),
              SizedBox(height: 5),
              Text("$Totallike"),
            ],
          ),
        ),
      ],
    ),
  );
}
