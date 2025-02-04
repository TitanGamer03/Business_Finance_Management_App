import 'dart:math';

import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children:[
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow.shade700,
                          ),
                        ),

                        Icon(Icons.person, size: 35,),
                      ]
                    ),

                    SizedBox(width: 8,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.outline),),

                        Text("User", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),),
                      ],
                    ),
                  ],
                ),

                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.settings)
                ),

              ],
            ),

            SizedBox(height: 20,),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,

              decoration: BoxDecoration(
                 color: Colors.red,
                borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 5),
                      blurRadius: 4,
                      color: Colors.grey.shade400,
                    ),
                  ],
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.tertiary,
                  ],
                  transform: GradientRotation(pi / 4),
                )
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("Total Balance", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16),),

                  SizedBox(height: 12,),

                  Text("₹ 1000.00", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 40),),

                  SizedBox(height: 12,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(Icons.arrow_downward, size: 14, color: Colors.greenAccent,),
                              ),
                            ),

                            SizedBox(width: 10,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Income", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 14),),

                                Text("₹ 2000.00", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14),),
                              ],
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(Icons.arrow_upward, size: 14, color: Colors.red,),
                              ),
                            ),

                            SizedBox(width: 10,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Expense", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 14),),

                                Text("₹ 1000.00", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14),),
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  )

                ],
              ),
            ),

            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transactions", style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),

                GestureDetector(
                  onTap: (){},
                  child: Text("View All", style: TextStyle( fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),)),
              ],
            ),

            SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, int i){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow,
                              ),
                            ),

                            SizedBox(width: 12,),

                            Text("Food", style: TextStyle( fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),

          ],
        ),
      ),

    );
  }
}