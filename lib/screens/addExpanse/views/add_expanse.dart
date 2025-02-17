import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/get_categories_bloc/get_categories_bloc.dart';
import 'category_creation.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {

  DateTime selectDate = DateTime.now();
  TextEditingController expanseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

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
                  controller: expanseController,
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

              SizedBox(height: 30,),
              TextFormField(
                readOnly: true,
                onTap: (){},
                controller: categoryController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Category",
                  prefixIcon: Icon(
                    Icons.list,
                    color: Colors.grey,
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.grey,
                    onPressed: (){
                      getCategoryCreation(context);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    borderSide: BorderSide.none,
                  )
                ),
              ),

              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
                    builder: (context, state) {
                      if(state is GetCategoriesSuccess) {
                        return ListView.builder(
                          itemCount: state.categories.length,
                          itemBuilder: (context, int i){
                            String imagePath = state.categories[i].icon;
                            print(state.categories[i].icon);
                            return Card(
                              child: ListTile(
                                leading: Image.asset(imagePath),
                                title: Text("Category"),
                                tileColor: Colors.red,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),

              SizedBox(height: 15,),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: ()async{
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100)
                  );
                  if(newDate != null){
                    setState(() {
                      dateController.text = DateFormat('dd/MM/yyyy').format(newDate);
                      selectDate = newDate;
                    });
                  }
                },
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Date",
                  prefixIcon: Icon(Icons.calendar_month, color: Colors.grey, size: 20,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )
                ),
              ),

              SizedBox(height: 30,),
              SizedBox(
                height: kToolbarHeight,
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  onPressed: (){},
                  child: Text("Add", style: TextStyle(color: Colors.white, fontSize: 25),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}