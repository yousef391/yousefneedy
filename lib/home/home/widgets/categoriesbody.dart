import 'package:flutter/material.dart';
import 'package:sign_in/home/home.dart';

import '../modals/categorycard.dart';

class categoriebody extends StatelessWidget {
  const categoriebody({
    super.key,
    required this.categories,
  });

  final List<cardcat> categories;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
    
          padding: const EdgeInsets.only(right: 15,left: 15,top: 24),
    
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
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NeedyApp()),
                        );
                           
                },
              ),
                 Text("Categories",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
               ],
             ),
             const SizedBox(height:15 ,),
              
              Expanded(
                child:  Container(
                  child: GridView.builder(
                    itemCount:  categories.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  childAspectRatio: 2/2.05,
                 
                  
                ),
               itemBuilder: (context, index) {
                 return categories[index];
               },
              
               ),
                ),
              ),
    
            ],
          )),
    );
  }
}