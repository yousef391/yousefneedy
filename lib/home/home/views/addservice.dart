

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';


class addservice {
  void addneeds (String category ,String desc, String genre,String title, String location, String nameofcategories) async{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseStorage _storage = FirebaseStorage.instance;
    CollectionReference needs  = FirebaseFirestore.instance.collection('Needs');
   
    String? imageurl;

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

    needs.add({
      'catégorie' : nameofcategories,
      'imageurl' : category,
      'descreiption' :desc
      ,'genre' : genre,
      'servicetype':title,
      'location' :location
      ,'date' :DateTime.now(),
      'id' :'2',

      'name' :_auth.currentUser?.displayName ?? '',
      'imageuser':imageurl
      




   } );
  }
  
}