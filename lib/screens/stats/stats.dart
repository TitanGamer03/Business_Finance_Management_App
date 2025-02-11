import 'package:flutter/material.dart';
import 'chart.dart';

class StateScreen extends StatelessWidget
{
  const StateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Transaction", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

            SizedBox(height: 20,),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                child: MyChart(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}