import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../color.dart';
import '../views/addscreen.dart';

class costumefloatingactionbutton extends StatelessWidget {
  const costumefloatingactionbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(

       onPressed:  () async {
          List<String> imagelist=[];
    List<String> namelist=[];
   
 await categoriesdocs(imagelist, namelist);


 

        Navigator.of(context).pushNamed(addscreen().id,arguments:MyRouteArguments(namelist:namelist, imagelist:imagelist));          
       },
       child: Icon(Icons.add,size:24,),
       backgroundColor: primarycolor,
     );
  }
}

class MyRouteArguments {
      List<String> imagelist=[];
    List<String> namelist=[];

 MyRouteArguments({required this.imagelist,required this.namelist});
}


 Future<void> categoriesdocs(List imagelist, List namelist) async {
      late String name;
     late String imageurl;
  QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('categories').get();
      snapshot.docs.forEach((element) {
        name=element.data()["name"];
        print(name);
         imageurl = element.data()["imageurl"];
       imagelist.add(imageurl);
         namelist.add(name);


      }
      );
      
 

}