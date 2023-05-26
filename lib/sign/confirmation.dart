import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'enter_pass.dart';

class confirm extends StatefulWidget {
  const confirm({super.key});

  @override
  State<confirm> createState() => confirmState();
}

class confirmState extends State<confirm> {
  @override
  Widget build(BuildContext context) {
    void navigatenextpage(BuildContext ctx) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        return add_pass();
      }));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF0097B2),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
//needy
                Center(
                  child: Text(
                    "Needy",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Pacifico",
                      fontSize: 35,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  width: 343,
                  height: 580,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      //text1
                      SizedBox(
                        height: 127,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 26, left: 0),
                        child: Text(
                          "OTP Verification",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //text 02
                      Padding(
                        padding: const EdgeInsets.only(top: 13, left: 20),
                        child: Text(
                          "Enter the verification code we just sent on your email address.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      //otp codet
                      Form(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      //send code  button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ElevatedButton(
                          onPressed: () {
                            navigatenextpage(context);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // <-- Radius
                              ),
                              backgroundColor: Color(0xFF0097B2),
                              padding: EdgeInsets.symmetric(vertical: 17)),
                          child: Center(
                            child: Text(
                              "Verify",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
