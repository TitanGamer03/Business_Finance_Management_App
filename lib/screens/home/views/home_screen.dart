import 'dart:math';
import 'package:business_finance_management_apk/screens/stats/stats.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Color selected = Colors.blue;
  Color unselected = Colors.grey;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          onTap: (value){
            setState(() {
              index = value;
            });
          },
          showSelectedLabels: false,
          backgroundColor: Colors.white,
          showUnselectedLabels: false,
          elevation: 3,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: index == 0 ? selected : unselected,),
              label: "home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph, color: index == 1 ? selected : unselected,),
              label: "stats",
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        shape: CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.tertiary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ],
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
              transform: GradientRotation(pi / 4), // You Can choose any one.
            )
          ),
          child: Icon(Icons.add)
        ),
      ),

      body: index == 0 ? MainScreen() : StateScreen(),

    );
  }
}