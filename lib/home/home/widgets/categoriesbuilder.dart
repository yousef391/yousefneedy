import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../modals/categorycard.dart';

class categoriesbuilder extends StatelessWidget {
   categoriesbuilder({
    super.key,
    required this.Categories,
  });

 final  CollectionReference Categories ;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Categories.snapshots(),
      builder: (context, snapshot) { 
      
      
         if (snapshot.hasData){

               List<cardcat> categories=[];
   for(int i=0;i<snapshot.data!.docs.length; i++){
    categories.add( cardcat(data:snapshot.data!.docs[i] ,) );
   
   }
        return Container(
          color: Colors.transparent,
          height: 131,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
            return  cardcat(data:snapshot.data!.docs[index]) ;
            },
          ),
        );} else {
          return Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}