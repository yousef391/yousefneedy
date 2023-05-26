// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, annotate_overrides

import 'package:flutter/material.dart';
import 'package:sign_in/sign/sign_in.dart';

class IntroPage1 extends StatelessWidget {
  @override
    PageController _controller = PageController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              
              SizedBox(height: 120),
              Image.asset(
                "images/rr1.png",
                height: 296,
                width: 600,
              ),
              Text(
                'Welcome to needy',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  fontFamily:'Urbanist' ,
                  height: 2,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Text(
                    "The first helping service application" ,
                    style: const TextStyle(
                      fontFamily:'Urbanist',
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 5),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Text(
                    "mobile in algeria" ,
                    style: const TextStyle(
                      fontFamily:'Urbanist',
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
