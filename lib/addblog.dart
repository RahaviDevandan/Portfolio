import 'package:flutter/material.dart';
import 'package:my_profile/auth.dart';
import 'package:my_profile/coolers.dart';
import 'package:my_profile/database_service.dart';
import 'package:my_profile/responsive.dart';

class AddBlog extends StatefulWidget {
  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  late String Title;
  late String desc;

  final _cTitle = TextEditingController();
  final _cdesc = TextEditingController();
  bool empty = true;
  final AuthService as = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coolers.secondaryColor,
      body: Container(
        padding: ResponsiveWidget.isSmallScreen(context)
            ? EdgeInsets.fromLTRB(50, 0, 50, 0)
            : EdgeInsets.fromLTRB(200, 0, 200, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                    child: Text("LOG OUT"),
                    onPressed: () async {
                      var result = await as.signOut();
                      print("logged out");
                      Navigator.of(context).pop();
                    })
              ],
            ),
            SizedBox(height: 30),
            RaisedButton(
              child: Text("ADD BLOG"),
              onPressed: () {
                if (empty == false) {
                  DatabaseService().addBlog(Title, desc);
                }
                setState(() {
                  _cTitle.clear();
                  _cdesc.clear();
                  empty = true;
                });
              },
            ),
            SizedBox(height: 30),
            TextField(
              controller: _cTitle,
              onChanged: (t) {
                setState(() {
                  Title = t;
                  if (t.isNotEmpty) empty = false;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter title",
              ),
            ),
            SizedBox(height: 30),
            TextField(
              maxLines: 12,
              controller: _cdesc,
              onChanged: (c) {
                setState(() {
                  desc = c;
                  if (c.isNotEmpty) empty = false;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter content",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
