import 'dart:math';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          backgroundColor: Colors.white,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
        
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph),
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

      body: MainScreen(),

    );
  }
}