import 'package:flutter/material.dart';
class titleAndseeall extends StatelessWidget {
 const  titleAndseeall({
    required this.title, this.ontap,
  }) ;

final title;
final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
       Text(title,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
       TextButton(child:const Text('see all',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),), onPressed: ontap,)
     ],);
  }
}