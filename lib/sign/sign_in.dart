import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sign_in/home/home.dart';
import 'package:sign_in/sign/forget_pass.dart';
import 'package:sign_in/sign/sign_up.dart';

class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  final formkey = GlobalKey<FormState>();
  void navigatenextpage(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return sign_up();
    }));
  }

  void navigatenextpage2(BuildContext ctx, email) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return forget_pass(email:email);
    }));
  }

  void navigatenextpage3(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return NeedyApp();
    }));
  }

  TextEditingController _emailControlleur = TextEditingController();
  TextEditingController _passwordControlleur = TextEditingController();

  bool isloading = false;
  Future<void> sign() async {
    setState(() {
      isloading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailControlleur.text,
        password: _passwordControlleur.text,
      );
      FirebaseAuth.instance.currentUser! ;
      navigatenextpage3(context);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    setState(() {
      isloading = false;
    });
  }

  bool b = true;

  //hnaa newpassword

  @override
  Widget build(BuildContext context) {
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
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            //text1
                            Padding(
                              padding: const EdgeInsets.only(top: 50, left: 0),
                              child: Text(
                                "Login account",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                            ),
                            //text2
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 30),
                              child: Text(
                                "Hello, you should login first to be able to use the  application and enjoy all the features in Needy.",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            //email textfield
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                              child: TextFormField(
                                  controller: _emailControlleur,
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
                                      labelText: 'Email',
                                      hintText: 'Enter Your email'),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                            .hasMatch(value)) {
                                      return "enter correct Email ";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            //password textfield
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                              child: TextFormField(
                                  controller: _passwordControlleur,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          b = !b;
                                        });
                                      },
                                      icon: Icon(
                                        b ? Icons.visibility_off : Icons.visibility,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.lock,
                                        color: Colors.grey, size: 20),
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
                                    labelText: '  Password',
                                    hintText: '  Enter Your password',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                            .hasMatch(value)) {
                                      return "at least 8 characters (uppercases,lowercases,numbers) ";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: b,
                                ),
                            ),
                                  
                            //forget password
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      navigatenextpage2(context, _emailControlleur.text);
                                    },
                                    child: Text(
                                      "Forget Password?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                          color: Color(0xFF0097B2), fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                                 SizedBox(height: 15) ,
                            //sign in button
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 17),
                              child: isloading
                                  ? CircularProgressIndicator()
                                  : ElevatedButton(
                                      onPressed: () async {
                                        if (this.formkey.currentState!.validate()) {
                                          
                                        await sign();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10), // <-- Radius
                                          ),
                                          backgroundColor: Color(0xFF0097B2),
                                          padding:
                                              EdgeInsets.symmetric(vertical: 17)),
                                      child: Center(
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                                  
                            SizedBox(
                              height: 15,
                            ),
                                  
                                  //devider
                                  
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don’t have an account?",
                                style: TextStyle(fontSize: 15),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: TextButton(
                                    onPressed: () {
                                      navigatenextpage(context);
                                    },
                                    child: Text(
                                      "Join Us",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                          color: Color(0xFF0097B2), fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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