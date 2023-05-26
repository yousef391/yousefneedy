// ignore_for_file: deprecated_member_use, unused_field

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_in/home/SettingsPage.dart';
import 'package:sign_in/home/home.dart';
import 'package:sign_in/sign/forget_pass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sign_in/auth.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _image;
  final picker = ImagePicker();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  

  var displayName = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0097B2),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              // needy
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
              //
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 500000,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Form(
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        //text1
                        Padding(
                          padding: const EdgeInsets.only(top: 50, left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: 28,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(width: 10,),
                              Text(
                                "Edit your profile",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 20,)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        //username textfield

                        // Add image picker code here
                        InkWell(
                          onTap: getImage,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: _image != null
                                ? ClipOval(
                                    child: Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(
                                    Icons.add_a_photo,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            'Change picture',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17),
                          child: TextFormField(
                            controller: displayName,
                            decoration: InputDecoration(
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
                              labelText: 'New username',
                              hintText: 'Enter new username',
                            ),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-zA-Z]{3,}$').hasMatch(value)) {
                                return "enter correct name ";
                              } else {
                                return null;
                              }
                            },
                            obscureText: false,
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => forget_pass(
                                          email: '',
                                        )),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Color(0xFF0097B2),
                              padding: EdgeInsets.symmetric(vertical: 17),
                            ),
                            child: Center(
                              child: Text(
                                // "Get a Confirmation Code"
                                "Create new password ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                // Update the user's name
                                FirebaseAuth.instance.currentUser!
                                    .updateDisplayName(displayName.text);

                                // Upload the image to Firebase Storage
                                if (_image != null) {
                                  final storageRef = _storage.ref().child(
                                      'profile_images/${_auth.currentUser!.uid}');
                                  await storageRef.putFile(_image!);

                                  // Get the download URL of the uploaded image
                                  final imageUrl =
                                      await storageRef.getDownloadURL();

                                  // Update the user's photo URL
                                  await _auth.currentUser!
                                      .updatePhotoURL(imageUrl);



await FirebaseFirestore.instance
    .collection('user')
    .doc(_auth.currentUser!.uid)
    .update({'imageuser': imageUrl});
    
                                      
                                }

                                // Show a success message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Profile updated successfully')),
                                );

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NeedyApp()),
                                );
                              } catch (e) {
                                // Show an error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Failed to update profile')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Color(0xFF0097B2),
                              padding: EdgeInsets.symmetric(vertical: 17),
                            ),
                            child: Center(
                              child: Text(
                                // "Get a Confirmation Code"
                                "Save",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
