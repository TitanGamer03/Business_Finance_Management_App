import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddExpanse extends StatelessWidget {
  const AddExpanse({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text("Add Expanse"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.currency_rupee, color: Colors.grey, size: 20,),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    )
                  ),
                ),
              ),

              SizedBox(height: 10,),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Category",
                    prefixIcon: Icon(Icons.list, color: Colors.grey, size: 20,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )
                ),
              ),

              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  // prefix: Icon(icons.),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                ),
              ),

              SizedBox(height: 10,),
              TextButton(
                onPressed: (){},
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}