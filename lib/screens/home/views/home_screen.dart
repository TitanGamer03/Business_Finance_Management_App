import 'dart:math';
import 'package:business_finance_management_apk/screens/stats/stats.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../addExpanse/blocs/create_categorybloc/create_category_bloc.dart';
import '../../addExpanse/blocs/create_expense_bloc/create_expense_bloc.dart';
import '../../addExpanse/blocs/get_categories_bloc/get_categories_bloc.dart';
import '../../addExpanse/views/add_expanse.dart';
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
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void> (builder: (BuildContext context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CreateCategoryBloc(FirebaseExpenseRepo()
                  ),
                ),

                BlocProvider(
                  create: (context) => GetCategoriesBloc(FirebaseExpenseRepo())..add(GetCategories())
                ),

                BlocProvider(
                  create: (context) => CreateExpenseBloc(FirebaseExpenseRepo()
                  ),
                ),
              ],
              child: const AddExpense(),
            ),
            ),
          );
        },
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