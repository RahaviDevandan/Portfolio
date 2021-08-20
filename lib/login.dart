import 'package:flutter/material.dart';
import 'package:my_profile/addblog.dart';
import 'package:my_profile/auth.dart';
import 'package:my_profile/coolers.dart';
import 'package:my_profile/responsive.dart';

final _formKey = GlobalKey<FormState>();
late String email;
late String password;
final AuthService as = AuthService();

Future<bool?> popUp(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      titlePadding: EdgeInsets.all(10),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Image.network(
                "https://cdn.pixabay.com/photo/2013/07/12/12/40/abort-146096_960_720.png",
                fit: BoxFit.cover),
          ),
        ],
      ),
      content: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildEmailFormField(),
              SizedBox(height: 30),
              buildPasswordFormField(),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                        child: Text(
                          "LOG IN",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _formKey.currentState!.save();
                          var result = await as.signInWithEmailAndPassword(
                              email, password);
                          print("$result");
                          if (result != null)
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => AddBlog()));
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      contentPadding: ResponsiveWidget.isSmallScreen(context)
          ? EdgeInsets.fromLTRB(40, 10, 40, 40)
          : EdgeInsets.fromLTRB(70, 0, 70, 60),
      contentTextStyle: TextStyle(color: Coolers.primaryColor),
      backgroundColor: Coolers.secondaryColor,
      elevation: 30,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  );
}

TextFormField buildPasswordFormField() {
  return TextFormField(
    obscureText: true,
    onSaved: (newValue) => password = newValue!,
    decoration: InputDecoration(
      hintText: "Enter your password",
      suffixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(Icons.lock),
      ),
      filled: false,
    ),
  );
}

TextFormField buildEmailFormField() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    onSaved: (newValue) => email = newValue!,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      hintText: "Enter your email",
      suffixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(Icons.email),
      ),
      filled: false,
    ),
  );
}
