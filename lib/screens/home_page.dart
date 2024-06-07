import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_language/data/data.dart';

import '../features/features.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Data data =Data();
  TextEditingController searchController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: _selectedIndex, onItemTapped:_onItemTapped,),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Choose language\nwhich you wanna learn",
                    style: textTheme.titleSmall!.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 305,
                    child: TextField(
                      controller: searchController,
                      autocorrect: false,
                      enableSuggestions: false,
                      style: TextStyle(color: Colors.white,),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(

                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.white,
                        hintText: "Start typing to search",
                        hintStyle: textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 15,

                        ),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                    ),
                    height: 500,
                    width: double.infinity,
                    child: GridView.builder(
                      padding: EdgeInsets.all(40),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 1),
                        itemCount:data.languageNames.length,itemBuilder: (context,index){
                         return GridTile(child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10.0),
                             color: Colors.white,
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Image.asset(
                                 data.flagImages[index],
                                 width: 100,
                                 height: 70,
                               ),
                               SizedBox(height: 2.0),
                               Text(
                                 data.languageNames[index],
                                 style: textTheme.titleMedium!.copyWith(
                                   fontWeight: FontWeight.bold,
                                   color: Theme.of(context).colorScheme.primary
                                 ),
                               ),
                             ],
                           ),
                         ));
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
