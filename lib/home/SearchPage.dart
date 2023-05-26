import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'home/modals/needcard.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> searchResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> searchInData(String searchText) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('Needs').get();

    final List<dynamic> data =
        querySnapshot.docs.map((doc) => doc.data()).toList();

    setState(() {
      searchResults = data
          .where((item) => item['servicetype']
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
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
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: 'Search for posts ...',
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Color(0xFF0097B2),
                          ),
                          onPressed: () {
                            searchInData(_searchController.text);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final item = searchResults[index];
                    return needcard(data: item);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
