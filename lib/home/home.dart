// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, avoid_unnecessary_containers, unused_field, unused_element, sort_child_properties_last, unused_import, avoid_web_libraries_in_flutter, sized_box_for_whitespace, prefer_final_fields, override_on_non_overriding_member, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icon.dart';
import 'package:sign_in/home/home/views/addscreen.dart';
import 'package:sign_in/home/home/views/categorie.dart';
import 'package:sign_in/home/home/views/needsscreen.dart';
import 'package:sign_in/home/home/views/screenbycategorie.dart';
import 'LocationPage.dart';
import 'SearchPage.dart';
import 'SettingsPage.dart';
import 'package:sign_in/home/home/views/categorie.dart';


import 'home/widgets/costumeappbar.dart';
import 'home/widgets/homebody.dart';


class NeedyApp extends StatefulWidget {
  @override
  _NeedyAppState createState() => _NeedyAppState();
}

class _NeedyAppState extends State<NeedyApp> {
  int _currentIndex = 0;
  late PageController _pageController;
CollectionReference Categories = FirebaseFirestore.instance.collection('categories');
CollectionReference Needs  = FirebaseFirestore.instance.collection('Needs');
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {

        needsscreen().id :(context) => needsscreen(),
        categoriesscreen().id :(context) => categoriesscreen(),
        addscreen().id :(context) => addscreen()
        ,bycategoriesscreen().id :(context) => bycategoriesscreen()

      },
      debugShowCheckedModeBanner: false,
      title: 'Needy',
      theme: ThemeData(
        
        primaryColor: Color(0xFF0097B2),
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.white,
            title: Text(
              'Needy',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 28,
                  color: Color(0xFF0097B2)),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  size: 28,
                  color: Color(0xFF0097B2),
                ),
                onPressed: () {
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  addscreen()),
                            );
                },
              ),
              
              SizedBox(
                width: 10,
              ),
              IconButton(
                icon: Icon(
                  LineIcons.search,
                  size: 28,
                  color: Color(0xFF0097B2),
                ),
                onPressed: () {
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  SearchPage()),
                            );
                },
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          body: SizedBox.expand(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
               homebody(categories: Categories, needs: Needs),
                categoriesscreen(),
                MapSample(),
                SettingsPage(),
              ],
            ),
          ),
          bottomNavigationBar: ClipRRect(
            child: GNav(
              backgroundColor: Colors.white,
              color: Color(0xFF0097B2),
              activeColor: Colors.white,
              gap: 8,
              tabBackgroundColor: Color(0xFF0097B2),
              onTabChange: (index) {
                setState(() {
                  _pageController.jumpToPage(index);
                });
              },
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                ),
                GButton(
                  icon: Icons.category,
                  text: 'Category',
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                ),
                GButton(
                  icon: Icons.location_on,
                  text: 'Location',
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
