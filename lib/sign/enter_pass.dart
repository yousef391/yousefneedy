import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sign_in/sign/sign_in.dart';
import 'sign_up2.dart';

class add_pass extends StatefulWidget {
  const add_pass({super.key});

  @override
  State<add_pass> createState() => add_passState();
}

class add_passState extends State<add_pass> {
  @override
  Widget build(BuildContext context) {
    void navigatenextpage(BuildContext ctx) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        return sign_up2();
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
                        height: 105,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 0),
                        child: Text(
                          "Create new password",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      //text 02
                      Padding(
                        padding: const EdgeInsets.only(top: 13, left: 20),
                        child: Text(
                          "Your new password must be unique from those previously used.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      //new pass textfield
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xFF0097B2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0XFFE8ECF4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0XFFE8ECF4)),
                            ),
                            fillColor: Color(0xFFF7F8F9),
                            filled: true,
                            hintText: 'New Password',
                          ),
                          maxLength: 20,
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xFF0097B2),
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {}, icon: Icon(Icons.info)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0XFFE8ECF4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0XFFE8ECF4)),
                            ),
                            fillColor: Color(0xFFF7F8F9),
                            filled: true,
                            hintText: 'Confirm Password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 38,
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
                              "Next",
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
