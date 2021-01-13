import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              color: maroon,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.04),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: MediaQuery.of(context).size.width / 7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Logo Here",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: maroon,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 2 / 4,
            color: Colors.white,
            child: ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07),
                    labelText: "Email",
                    labelStyle: TextStyle(color: maroon),
                    hintText: "example@gmail.com",
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.07),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07),
                    labelText: "password",
                    labelStyle: TextStyle(color: maroon),
                    hintText: "Enter your passowrd",
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.07),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08),
                  child: RaisedButton(
                    color: maroon,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.04),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.02),
                      child: Text("Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Center(
                  child: InkWell(
                    child: Text(
                      "Forgte passowrd?",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {},
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08),
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: maroon, width: 2),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.04),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "asset/facebook.svg",
                            color: maroon,
                            height: MediaQuery.of(context).size.width * 0.07,
                            width: MediaQuery.of(context).size.width * 0.07,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Text("Sign In with Facebook",
                              style: TextStyle(color: maroon, fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Don't have an account? "),
                    InkWell(
                      child: Text("Sign Up",
                          style: TextStyle(
                              color: maroon,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold)),
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
