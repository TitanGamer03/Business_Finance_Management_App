import 'package:business_finance_management_apk/screens/addExpanse/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../blocs/get_categories_bloc/get_categories_bloc.dart';
import 'category_creation.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {

  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  bool isLoading = false;
  late Expense expense;

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    expense = Expense.empty;
    expense.expenseId = const Uuid().v1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateExpenseBloc, CreateExpenseState>(
  listener: (context, state) {
    if (state is CreateExpenseSuccess) {
      Navigator.pop(context);
    } else if (state is CreateExpenseLoading) {
      setState(() {
        isLoading = true;
      });
    }
  },
  child: GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Add Expanse"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
        builder: (context, state) {
          if(state is GetCategoriesSuccess) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextFormField(
                        controller: expenseController,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.currency_rupee, color: Colors.grey,
                            size: 20,),
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
                      onTap: () {},
                      controller: categoryController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: expense.category == Category.empty
                        ? Colors.white
                        : Color(expense.category.color),
                        hintText: "Category",
                        prefixIcon: expense.category == Category.empty
                          ? const Icon(
                            Icons.list,
                            color: Colors.grey,
                            size: 20,
                          )
                          : Image.asset(expense.category.icon),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.grey,
                          onPressed: () async {
                            var newCategory = await getCategoryCreation(context);
                            setState(() {
                              state.categories.insert(0, newCategory);
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10)),
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
                        child: ListView.builder(
                          itemCount: state.categories.length,
                          itemBuilder: (context, int i) {
                            return Card(
                              child: ListTile(
                                onTap: (){
                                  setState(() {
                                    expense.category = state.categories[i];
                                    categoryController.text = expense.category.name;
                                  });
                                },
                                leading: state.categories[i].icon.contains("assets/icons/")
                                  ? Image.asset(state.categories[i].icon)
                                  : Image.asset("assets/icons/${state.categories[i]}.png", errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error, color: Colors.red);
                              }),

                              title: Text(state.categories[i].name),
                                tileColor: Color(state.categories[i].color),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 15,),
                    TextFormField(
                      controller: dateController,
                      readOnly: true,
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: expense.date,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100)
                        );
                        if (newDate != null) {
                          setState(() {
                            dateController.text =
                              DateFormat('dd/MM/yyyy').format(newDate);
                            expense.date = newDate;
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
                      child:isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        onPressed: () {
                          setState(() {
                            expense.amount = int.parse(expenseController.text);
                          });
                          context.read<CreateExpenseBloc>().add(CreateExpense(expense));
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
  );
  }
}