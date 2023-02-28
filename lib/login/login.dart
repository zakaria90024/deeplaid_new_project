import 'package:deeplaid/language/language.dart';
import 'package:deeplaid/login/loginDoctor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  String dropdownValue = 'Select Branch';

  @override
  void initState() {
    super.initState();
    Locale('en', 'US');
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      home: LoginPageBottom(),
    );
  }
}

class LoginPageBottom extends StatefulWidget {
  const LoginPageBottom({Key? key}) : super(key: key);

  @override
  State<LoginPageBottom> createState() => _LoginPageBottomState();
}

class _LoginPageBottomState extends State<LoginPageBottom> {
  bool passwordVisible = false;
  String dropdownValue = 'Select Branch';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  int _clickCount = 0;

  @override
  Widget build(BuildContext context) {
    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    int clickCount = 0;
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Center(child: Text("Login")),
        //   bottom: const TabBar(
        //     indicatorColor: Colors.white,
        //     labelColor: Colors.black,
        //     unselectedLabelColor: Colors.white,
        //     tabs: <Widget>[
        //       Tab(
        //         text: "MPO Login",
        //       ),
        //       Tab(
        //         text: "Doctor Login",
        //       ),
        //     ],
        //   ),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(
                height: 8,
                width: 8,
              ),
              TabBar(
                indicatorColor: Colors.blue,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print("clicked tab1");
                    },
                    child: Tab(
                      text: "mpo".tr,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("clicked tab2");
                    },
                    child: Tab(
                      text: "doctor".tr,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 80,
                width: 80,
              ),

              Opacity(
                opacity: 1,
                child: SizedBox(
                  height: deviceHight * 0.50,
                  width: deviceWidth,
                  child: Container(
                    child: Column(
                      children: [
                        //1092017
                        // Card(
                        //   child: InkWell(
                        //     splashColor: Colors.blue,
                        //     onTap: () {},
                        //     child: const SizedBox(
                        //       height: 250,
                        //       width: 350,
                        //       child: Text("IM CARD for "),
                        //     ),
                        //   ),
                        //   color: Colors.white,
                        //   clipBehavior: Clip.hardEdge,
                        // ),
                        Card(
                          elevation: 3,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: SizedBox(
                            width: 350,
                            height: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 22, right: 22, top: 12),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      String url = 'https://google.com'.tr;
                                      launch(url);
                                    },
                                    child: Text(
                                      "web_portal".tr,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),

                                  // TextButton(onPressed: (){
                                  //
                                  // }, child: Text("bn")),

                                  TextField(
                                    controller: _emailController,
                                    maxLength: 6,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black),
                                      ),
                                      labelText: 'user_id'.tr,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                    width: 16,
                                  ),
                                  TextField(
                                    controller: _passwordController,
                                    obscureText: passwordVisible,
                                    decoration: InputDecoration(
                                      enabledBorder:
                                          const UnderlineInputBorder(),
                                      labelText: "password".tr,
                                      //helperText: "Password must contain special character",
                                      helperStyle:
                                          const TextStyle(color: Colors.green),
                                      suffixIcon: IconButton(
                                        icon: Icon(passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(
                                            () {
                                              passwordVisible =
                                                  !passwordVisible;
                                            },
                                          );
                                        },
                                      ),
                                      alignLabelWithHint: false,
                                      filled: false,
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                  ),
                                  Row(
                                    children: [
                                      DropdownButton<String>(
                                        underline: Container(),
                                        // Step 3.
                                        value: dropdownValue,
                                        // Step 4.
                                        items: <String>[
                                          'Select Branch',
                                          '0001-Homeo',
                                          '0003-Harbal'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          );
                                        }).toList(),
                                        // Step 5.
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  // const Text(
                                  //   //'Selected: $dropdownValue',
                                  //   "",
                                  //   style: TextStyle(
                                  //       fontSize: 12,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  ElevatedButton(
                                      onPressed: () {
                                        var emailText = _emailController.text;
                                        var passwordText =
                                            _passwordController.text;
                                        Fluttertoast.showToast(
                                            msg:
                                                "User id = $emailText\n Password = $passwordText\n Selected = $dropdownValue",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.black,
                                            fontSize: 12.0);

                                        //Navigator.push((context),MaterialPageRoute(builder: (context)=> HomePage("gome")));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        primary: Colors.grey,
                                        elevation: 0,
                                      ),
                                      child: SizedBox(
                                        height: 25,
                                        width: 280,
                                        child: Center(
                                            child: Text(
                                          "login".tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // TabBarView(
              //   children: <Widget>[
              //     Center(
              //       child: Text("MPO Login"),
              //     ),
              //     Center(
              //       child: Text("Doctor Login"),
              //     ),
              //
              //   ],
              // ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              _clickCount++; // increment click count
            });

            if (_clickCount == 1) {
              Get.updateLocale(Locale('bn', 'BD'));
            } else if (_clickCount == 2) {
              Get.updateLocale(Locale('en', 'US'));
              _clickCount = 0;
            }
          },
          label: Text(
            'bangla'.tr,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          //icon: const Icon(Icons.thumb_up),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
