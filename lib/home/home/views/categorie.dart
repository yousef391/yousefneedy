import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../modals/categorycard.dart';
import '../widgets/categoriesbody.dart';



class categoriesscreen extends StatelessWidget {
 categoriesscreen({super.key});
final CollectionReference categories = FirebaseFirestore.instance.collection('categories');
final String id="catscreeen";
  @override
  Widget build(BuildContext context) {
   return  StreamBuilder<QuerySnapshot>(

      stream: categories.snapshots(),
    
      builder: (context, snapshot) {
     
        if (snapshot.hasData) {
               List<cardcat> categories=[];
   for(int i=0;i<snapshot.data!.docs.length; i++){
    categories.add( cardcat(data:snapshot.data!.docs[i] ,) );
    
   }
return Scaffold(
        
        body:
         categoriebody(categories: categories)
        );
}else {
  return Center(
    child: CircularProgressIndicator(
    
    ),
  );
}
      },
    );
     }
}

