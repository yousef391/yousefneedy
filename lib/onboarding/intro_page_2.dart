import 'package:flutter/material.dart';

import 'package:sign_in/sign/sign_in.dart';

class IntroPage2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
     Container(
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              
        
              //skiip    ndir row
        
              SizedBox(height: 120),
              Image.asset(
                "images/rr2.png",
                height: 296,
                width: 600,
              ),
              Text(
                'Find Solutions',
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
                    "Get help when you need it most.",
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