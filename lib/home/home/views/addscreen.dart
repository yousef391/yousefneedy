import 'package:flutter/material.dart';
import '../color.dart';
import '../widgets/costumefloatingactionbutton.dart';
import 'addservice.dart';

class addscreen extends StatefulWidget {
addscreen({Key? key}) : super(key: key);
final id='addscreen';

  @override
  State<addscreen> createState() => _addscreenState();
}

class _addscreenState extends State<addscreen> {

late List<String> categorieoption;
int? selectedcategory;
  String? selectedgenre='needy';
 
 String? desc;
 
  String? title;
   String? location;
   GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  
 
  @override
  Widget build(BuildContext context)  {
    
final args = ModalRoute.of(context)!.settings.arguments as MyRouteArguments;
List<String> imagelist = args.imagelist;
List<String> namelist = args.namelist;

    return SafeArea(
      child: Scaffold(
         backgroundColor:  Colors.white,
        
        
        body:
        Padding(
          padding: const EdgeInsets.all(16),
          child:
           Form(
             key: key
           ,
             child: ListView(
              
              children: [
                 SizedBox(height: 70,),
           
              Text('What do you want to share ?',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              SizedBox(height: 21,),
                
            DropdownButtonFormField(
             
                     
                    items: ['needy','benefactor']
                        .map((option) => DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            ))
                        .toList(),
                        
                    onChanged: (value) {
        
                      setState(() {
                        selectedgenre= value;
                      });
                    },
                    icon: Icon(Icons.arrow_drop_down_circle,color: primarycolor,),
                    dropdownColor: primarycolor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(color: primarycolor,Icons.person),
                      contentPadding: EdgeInsets.symmetric(vertical: 19.5, horizontal: 19.5),
              
                      border: OutlineInputBorder(
                      ),
                      hintText: 'Needy',
                      isDense: true,
                    ),
                  ),
            SizedBox(height: 19,),
            DropdownButtonFormField(
                     
                    items: namelist
                        .map((option) => DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedcategory= namelist.indexOf(value!);
    
                      });
                    },
                    icon: Icon(Icons.arrow_drop_down_circle,color: primarycolor,),
                    dropdownColor: primarycolor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(color: primarycolor,Icons.category),
                      contentPadding: EdgeInsets.symmetric(vertical: 19.5, horizontal: 19.5),
              
                      border: OutlineInputBorder(
                      ),
                      hintText: 'category',
                      isDense: true,
                    ),
                  ),
           SizedBox(height: 21,),
           TextFormField(
           validator: (value) {
            if (value?.isEmpty ?? true){
              return 'value empty';
    
            } else 
           { return null;}
          },
                onChanged: (value) {
                  title =value;
                },
                decoration: InputDecoration(
                
                  label: Text('Title'),
                  border:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red,)
                  )
           
                ),
              
             ),
           SizedBox(height: 21,),
           TextFormField(
            validator: (value) {
            if (value?.isEmpty ?? true){
              return 'value empty';
    
            } else 
           { return null;}
          },
             onChanged: (value) {
               desc=value;
             },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom:68 ,left: 10),
                  label: Text('decription'),
                  border: OutlineInputBorder(
                    
                  )
           
                ),
                
              ),
           SizedBox(height: 21,),
           TextFormField(
            validator: (value) {
            if (value?.isEmpty ?? true){
              return 'value empty';
    
            } else 
           { return null;}
          },
             onChanged: (value) {
               location=value;
             },
                decoration: InputDecoration(
                  label: Text('location'),
                  border: OutlineInputBorder(
                    
                  )
           
                ),
                
              )
              ,
           
              SizedBox(height: 21,),
              ElevatedButton(onPressed:(() {
                if (key.currentState!.validate()) {
                addservice().addneeds(imagelist[selectedcategory!]  , desc!, selectedgenre!, title!, location!, namelist[selectedcategory!]);
                Navigator.of(context).pop();}
                else {
                   autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                }
                
              }), child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal:20),
                child: Text('Post',style: TextStyle(fontSize: 20),),
              ),
              style: ElevatedButton.styleFrom(
           backgroundColor: primarycolor
               ),
              )
              
                   ]),
           ),
        ) ,
      ),
    );
  }
}
