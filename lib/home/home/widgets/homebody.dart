import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/home/home/widgets/titleandseeall.dart';


import '../views/categorie.dart';
import '../views/needsscreen.dart';
import 'categoriesbuilder.dart';
import 'costumefloatingactionbutton.dart';
import 'needsbuilder.dart';



class homebody extends StatelessWidget {
  const homebody({
   
    required this.categories,
    required this.needs,
  });

  final CollectionReference<Object?> categories;
  final CollectionReference<Object?> needs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 8,left: 8,top: 8),
        child:   
        Column(
         children:[
             titleAndseeall(title: " Categories",ontap: () => Navigator.of(context).pushNamed(categoriesscreen().id),),
        const   SizedBox(height: 10,),
              categoriesbuilder(Categories: categories),
             const   SizedBox(height: 10,),
               titleAndseeall(title: " Posts", ontap: () =>Navigator.of(context).pushNamed( needsscreen().id) ,),
              const   SizedBox(height: 10,),
                   Expanded(child: needsbuilder(Needs: needs,Categories: categories)),
    
                 
    
       ] )
        
      ),
    );
  }
}



