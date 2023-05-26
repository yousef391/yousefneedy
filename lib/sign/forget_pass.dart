import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'enter_pass.dart';

class forget_pass extends StatefulWidget {
  forget_pass({super.key, required this.email});
  String email;
  @override
  State<forget_pass> createState() => _forget_passState();
}

class _forget_passState extends State<forget_pass> {
  TextEditingController _emailControlleur = TextEditingController();
  @override
  void dispose(){
    _emailControlleur.dispose();
    super.dispose();
  }
  @override
  void initState(){
    super.initState();
    if(widget.email.isNotEmpty){
      _emailControlleur.text = widget.email;
    }
  }
    Future forgetPass() async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailControlleur.text.trim());
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Password resent link sent! check your email!'),
                TextButton(onPressed: (){ Navigator.pop(context);
      Navigator.pop(context);}, child: Text('OK'))
              ],
            ),
          );
        },
      );
     
  } on FirebaseAuthException catch(e) {
    print(e);
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    });
  }
    }

  
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
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
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
                  height: 50,
                ),

                Container(
                  width: double.infinity,
                  height: 50000,
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
                          "Create new password",
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
                          "Don't worry! It occurs. Please enter the email address linked with your account.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      //email textfield
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: TextField(
                            controller: _emailControlleur, // hdi li knt nasyatha 

                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail_rounded,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0XFFE8ECF4)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0XFFE8ECF4)),
                              ),
                              fillColor: Color(0xFFF7F8F9),
                              filled: true,
                              hintText: 'Enter Your email'),
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),

                      SizedBox(
                        height: 38,
                      ),
                      //send code  button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: ElevatedButton(
                          onPressed: () {
                            //hnaa
                           // navigatenextpage(context);
                           forgetPass();

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
                              "Reset password",
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
