import 'dart:math'; // Add this import for random number generation

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_language/features/features.dart';

import '../data/data.dart';

class LessonsCourse extends StatefulWidget {
  const LessonsCourse({Key? key}) : super(key: key);

  @override
  State<LessonsCourse> createState() => _LessonsCourseState();
}

class _LessonsCourseState extends State<LessonsCourse> {
  Data data = Data();
  int _selectedIndex = 0;
  int _selectedCourseIndex = -1;

  // Add a random generator
  final Random _random = Random();

  // Store random percentages for each course banner
  late List<int> _randomPercentages;

  @override
  void initState() {
    super.initState();
    _randomPercentages = List<int>.generate(
      data.courseBanner.length,
          (index) => _random.nextInt(101), // Generate random percentages between 0 and 100
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCourseTapped(int index) {
    setState(() {
      _selectedCourseIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 0.0, left: 25, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "English lessons",
              style: textTheme.titleSmall!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // Set scroll direction to horizontal
                itemCount: data.courseLevels.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onCourseTapped(index),
                    child: getCard(data.courseLevels[index], index),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: SizedBox(
                height: 569,
                child: ListView.builder(
                  itemCount: data.courseBanner.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Card(
                            child: Container(
                              height: 220,
                              width: 350,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(data.courseBanner[index]['image'].toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 35.0, top: 35, left: 20, right: 35),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white70
                                ),
                                height: 45,
                                width: 45,
                                child: CircularPercentageIndicator(
                                  strokeWidth: 4,
                                  percentage: _randomPercentages[index].toDouble(),
                                  progressColor: Theme.of(context).colorScheme.primary,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCard(Map<String, String> course, int index) {
    bool isSelected = index == _selectedCourseIndex;
    return Container(
      margin: EdgeInsets.only(right: 8), // Add margin between items
      padding: EdgeInsets.symmetric(horizontal: 25), // Added padding for text
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepOrange : Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(5), // Added rounded corners
      ),
      child: Center(
        child: Text(
          course['level']!,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
