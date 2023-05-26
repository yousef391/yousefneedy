import 'package:flutter/material.dart';

import 'package:sign_in/sign/sign_in.dart';

class IntroPage3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Container(
child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              
        
              //skiip    ndir row
        
              SizedBox(height: 120),
              Image.asset(
                "images/rr3.png",
                height: 296,
                width: 600,
              ),
              Text(
                'Give Back',
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
                    "Donate services and items you no ",
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
                    "longer need.",
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