


import 'package:flutter/material.dart';

import '../color.dart';
import '../views/needsscreen.dart';
import 'package:url_launcher/url_launcher.dart';



class needcard extends StatelessWidget {
   needcard({this.data});

final  data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
    
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11,horizontal:14 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 new Image.network(data["imageuser"],height: 60,width: 62,),
                  SizedBox(width: 16,),
                
                  Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16), ),
                      SizedBox(height: 1,),
                      Text(data['genre'],style: TextStyle(fontSize: 12,color: Colors.lightBlue,fontWeight: FontWeight.bold),),
                      SizedBox(height: 3,),
                      Row(children:[ Icon(Icons.location_pin,color:Colors.red,size: 14,),SizedBox(width: 4,),Text(data['location'],style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)]),
                    ],
                  )
                  ,
                  Expanded(child: SizedBox()),
                  Image.network(data["imageurl"],fit: BoxFit.fill ,width: 50,),
                ],
                
              ),
              SizedBox(height: 13,),
              Text(data['servicetype'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.start,),
              SizedBox(height: 10,),
              Text(data['descreiption']),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(onPressed: () async {
                //hna nkhdam
                        final Uri url = Uri(
                          scheme: 'tel',
                          path: '0672443287',
                        );
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print('cannot');
                        }
                      },
                       child: Text('Contact',
                       style: TextStyle(
                        fontSize: 12
                       ),),style:ElevatedButton.styleFrom(
                    backgroundColor: primarycolor
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}