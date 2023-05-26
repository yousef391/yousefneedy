import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../modals/needcard.dart';
import '../widgets/costumefloatingactionbutton.dart';
import '../widgets/needsbuilder.dart';


class bycategoriesscreen extends StatelessWidget {
 bycategoriesscreen({super.key});
 final CollectionReference Categories = FirebaseFirestore.instance.collection('categories');
final CollectionReference Needs  = FirebaseFirestore.instance.collection("Needs");
 final String id='bycategoriecreen';
  @override
  Widget build (BuildContext context) {
      final String champ = ModalRoute.of(context)?.settings.arguments as String;

    return 
      

     SafeArea(
       child: Scaffold( 
         backgroundColor:  Colors.white,
      
       
         
        body:Padding(
          padding: const EdgeInsets.only(top:24.0, right: 8, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                    Text("Posts",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                   ],
                 ),
                 const SizedBox(height:15 ,),
              Expanded(child: StreamBuilder<QuerySnapshot>(
      stream: Needs.where('catégorie', isEqualTo: champ).snapshots(),
      builder: (context, snapshot) {

        if (snapshot.hasData) {
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
    )),
            ],
          ),
        )
       ),
     );
     
    
  
}}

