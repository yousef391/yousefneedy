import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_in/sign/sign_in.dart';
import 'new_pass.dart';

class sign_up2 extends StatefulWidget {
  const sign_up2({super.key});

  @override
  State<sign_up2> createState() => sign_up2State();
}

class sign_up2State extends State<sign_up2> {
  @override
  Widget build(BuildContext context) {
    void navigatenextpage(BuildContext ctx) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        return new_pass();
      }));
    }

    File? file;
    ImagePicker image = ImagePicker();

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
                      SizedBox(
                        height: 100,
                      ),
                      //photo
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          radius: 55,
                          child: Icon(
                            Icons.add_a_photo,
                            size: 30,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                      ),

                      //register button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // <-- Radius
                              ),
                              backgroundColor: Color(0xFF0097B2),
                              padding: EdgeInsets.symmetric(vertical: 17)),
                          child: Center(
                            child: Text(
                              "Get Started",
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
