// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'intro_page_1.dart';
import 'intro_page_2.dart';
import 'intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sign_in/sign/sign_in.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
//controlleur to keep track of which page we're on
  PageController _controller = PageController();
  //keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    'Needy',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(255, 0, 151, 178),
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),

                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  sign_in()),
                            );
                    },
                    child: Text(
                      'skip',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          Container(
            alignment: Alignment(0, 0.8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 30,
                ),

                //dot indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: SlideEffect(
                    spacing: 7.0,
                    dotColor: Color.fromARGB(255, 224, 222, 222),
                    activeDotColor: Color(0xFF0097B2),
                    dotWidth: 13,
                    dotHeight: 13,
                  ),
                ),

                //next or done
                SizedBox(
                  height: 50,
                ),
                onLastPage
                    ? SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0097B2),
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return sign_in();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0097B2),
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text(
                            'next',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
