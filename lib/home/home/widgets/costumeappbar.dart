import 'package:flutter/material.dart';

import '../color.dart';


class costumappbar extends StatelessWidget {
  const costumappbar({
    super.key,  
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
      backgroundColor: Colors.white,
      title: Text('Needy',style:  TextStyle(fontFamily: 'Pacifico' ,color: primarycolor,fontSize: 30),),
      
      actions: [Padding(
        padding: const EdgeInsets.only(right: 8),
        child: IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 30,color: primarycolor,)),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: IconButton(onPressed: (){}, icon: Icon(Icons.notifications_on,size: 30,color: primarycolor,)),
      )
       ],
      
      );
  }
}