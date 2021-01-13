import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'size.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      title: "loginScreen",
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color maroon = Color.fromRGBO(128, 0, 0, 1);

  bool visible = false;
  @override
  Widget build(BuildContext context) {
    Size size = new Size(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: size.screenWidth(),
              height: size.screenHeight() / 3,
              color: maroon,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: size.height(40)),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: size.width(50),
                child: Padding(
                  padding: EdgeInsets.all(size.height(8)),
                  child: Text(
                    "Logo Here",
                    style: TextStyle(
                      fontSize: size.font(25),
                      fontWeight: FontWeight.bold,
                      color: maroon,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: size.height(50)),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: size.width(25)),
                    labelText: "Email",
                    labelStyle:
                        TextStyle(color: maroon, fontSize: size.font(18)),
                    hintText: "example@gmail.com",
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: size.width(25)),
                      child: Icon(Icons.mail, color: maroon),
                    ),
                  ),
                  validator: (value) {
                    if (value.contains("@") && value.contains(".")) {
                      return null;
                    } else
                      return "Enter a valid e-mail";
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: size.height(25)),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: size.width(25)),
                    labelText: "password",
                    labelStyle:
                        TextStyle(color: maroon, fontSize: size.font(18)),
                    hintText: "Enter your passowrd",
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: size.width(25)),
                      child: IconButton(
                        icon: Icon(
                            visible ? Icons.visibility : Icons.visibility_off,
                            color: maroon),
                        onPressed: () => setState(() {
                          visible = !visible;
                        }),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return null;
                    } else
                      return "Enter a password";
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: visible,
                  obscuringCharacter: "*",
                ),
                SizedBox(height: size.height(25)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width(30)),
                  child: RaisedButton(
                    color: maroon,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.height(30)),
                    ),
                    onPressed: () {},
                    child: Container(
                      height: size.height(60),
                      alignment: Alignment.center,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.font(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height(15)),
                Center(
                  child: InkWell(
                    child: Text(
                      "Forgte passowrd?",
                      style: TextStyle(
                          color: Colors.black, fontSize: size.font(13)),
                    ),
                    onTap: () {},
                  ),
                ),
                SizedBox(height: size.height(15)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width(30)),
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: maroon, width: size.width(2)),
                      borderRadius: BorderRadius.circular(size.width(30)),
                    ),
                    onPressed: () {},
                    child: Container(
                      height: size.height(60),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "asset/facebook.svg",
                            color: maroon,
                            height: size.height(35),
                            width: size.height(35),
                          ),
                          SizedBox(width: size.width(20)),
                          Text("Sign In with Facebook",
                              style: TextStyle(
                                  color: maroon, fontSize: size.font(18))),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Don't have an account? ",
                        style: TextStyle(fontSize: size.font(13))),
                    InkWell(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: maroon,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: size.font(13),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
