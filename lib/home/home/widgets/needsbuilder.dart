import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../modals/needcard.dart';

class needsbuilder extends StatelessWidget {
  const needsbuilder({
    super.key,
    required this.Needs, required this.Categories,
  });
final CollectionReference<Object?> Categories;
  final CollectionReference  Needs;


  @override
  Widget build(BuildContext context) {


// Build a query to retrieve the document with the specified champ name




    return StreamBuilder<QuerySnapshot>(
      stream: Needs.orderBy('date',descending: true).snapshots(),
      builder: (context, snapshot) {

        if (snapshot.hasData && !snapshot.hasError) {
                       List<needcard> needs=[];
   for(int i=0;i<snapshot.data!.docs.length; i++){
    needs.add( needcard(data:snapshot.data!.docs[i],  ) );
   
   }
  return Container(
                color: Colors.transparent,
                
                child: ListView.builder(
                  
                  itemCount: needs.length ,
                  itemBuilder: (BuildContext context, int i) {
                  return needs[i];
                  },
                ) 
              );
} else {
  return Center(
    child: CircularProgressIndicator(
    
    ),
  );
}
      }
    );}









}