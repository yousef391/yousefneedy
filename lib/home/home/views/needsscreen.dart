import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/costumefloatingactionbutton.dart';
import '../widgets/needsbuilder.dart';


class needsscreen extends StatelessWidget {
 needsscreen({super.key});
 final CollectionReference Categories = FirebaseFirestore.instance.collection('categories');
final CollectionReference Needs  = FirebaseFirestore.instance.collection("Needs");
 final String id='needscreen';
  @override
  Widget build (BuildContext context) {
    return  SafeArea(
       child: Scaffold( 
         backgroundColor:  Colors.white,
        floatingActionButton:
       const  costumefloatingactionbutton(),
       
         
        body:Padding(
          padding: const EdgeInsets.only(top:24.0, right: 8, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                   children: [
                    IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios ,
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
              Expanded(child: needsbuilder(Needs: Needs, Categories:Categories ,)),
            ],
          ),
        )
       ),
     );
     
    
  
}}

