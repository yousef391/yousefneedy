import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sign_in/home/Editpage.dart';
import 'package:sign_in/home/home/views/needsscreen.dart';
import 'package:sign_in/sign/new_pass.dart';
import 'package:sign_in/sign/sign_in.dart';
import '../auth.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  String? imageurl;

  @override
  void initState() {
    super.initState();
   
  }

  Future<Image> _loadProfilePicture() async {
    if (_auth.currentUser != null) {
    
    

 await FirebaseFirestore.instance
    .collection('user')
    .doc(_auth.currentUser!.uid)
    .get()
    .then((DocumentSnapshot doc) {
      if (doc.exists) {
    final data = doc.data() as Map<String, dynamic>;
imageurl=data["imageurl"];
  
    
      } 
    });
   
    } 
    return Image.network(imageurl!,fit: BoxFit.fill ,);
  }

  Future<void> _signOut() async {
    await auth().signOut();
  }

  void _navigateToSignInPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return sign_in();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 FutureBuilder<Image>(
                   future: _loadProfilePicture(),
                   
                   builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                     return CircleAvatar(backgroundImage:snapshot.data ,radius: 32,) ;
                   } else {
                  return  CircularProgressIndicator();
                   }
                   }
                 ),
                  SizedBox(width: 25),
                  Text(
                    _auth.currentUser?.displayName ?? '',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Edit Profile'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfileScreen()),
                        );
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text('My posts'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => needsscreen()),
                        );
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Color(0xff0097b2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        _signOut();
                        _navigateToSignInPage(context);
                      },
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
