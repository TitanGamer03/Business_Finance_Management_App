import 'package:expense_repository/expense_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../blocs/create_categorybloc/create_category_bloc.dart';

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

  List<String> iconList = [
    'assets/icons/food.png',
    'assets/icons/home.png',
    'assets/icons/shopping.png',
    'assets/icons/tech.png',
    'assets/icons/travel.png',
  ];

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
                      showDialog(
                        context: context,
                        builder: (ctx){
                          bool isExpanded = false;
                          Color categoryColor = Colors.white;
                          String iconSelected = "";
                          TextEditingController categoryNameController = TextEditingController();
                          TextEditingController categoryIconController = TextEditingController();
                          TextEditingController categoryColorController = TextEditingController();
                          return BlocProvider.value(
                            value: context.read<CreateCategoryBloc>(),
                            child: BlocListener<CreateCategoryBloc, CreateCategoryState>(
                              listener: (context, state){
                                if(state is CreateCategorySuccess){
                                Navigator.of(ctx).pop();
                                }
                              },
                              child: AlertDialog(
                                title: const Text("Create Category"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      // height: 500,
                                      width: MediaQuery.of(context).size.width,
                                      child: TextFormField(
                                        controller: categoryNameController,
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "Name",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 15,),
                                    TextFormField(
                                      controller: categoryIconController,
                                      readOnly: true,
                                      onTap: () {
                                        setState(() {
                                          isExpanded = !isExpanded;
                                        });
                                      },
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        suffix: Icon(Icons.keyboard_arrow_down),
                                        fillColor: Colors.white,
                                        hintText: "Icon",
                                        border: OutlineInputBorder(
                                          borderRadius: isExpanded
                                            ? const BorderRadius.vertical(top: Radius.circular(15)) : BorderRadius.circular(15),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),

                                    isExpanded
                                      ? Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
                                        ),
                                      child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: GridView.builder(
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 5,
                                          crossAxisSpacing: 5
                                        ),
                                        itemCount: iconList.length,
                                        itemBuilder: (context, int i) {
                                          return GestureDetector(
                                            onTap: (){
                                              setState((){
                                                iconSelected = iconList[i];
                                              });
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 3,
                                                  color: iconSelected == iconList[i] ? Colors.green : Colors.grey
                                                ),
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: AssetImage(iconList[i]),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                  : Container(),

                                    SizedBox(height: 15,),
                                    TextFormField(
                                      controller: categoryColorController,
                                      readOnly: true,
                                      onTap: (){
                                        showDialog(
                                          context: context,
                                          builder: (ctx2){
                                            return AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ColorPicker(
                                                    pickerColor: Colors.white,
                                                    onColorChanged: (value){
                                                      setState((){
                                                        categoryColor = value;
                                                      });
                                                    },
                                                  ),

                                                  SizedBox(
                                                    height: 50,
                                                    width: double.infinity,
                                                    child: TextButton(
                                                      style: TextButton.styleFrom(
                                                        backgroundColor: Colors.black,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(10)
                                                        )
                                                      ),
                                                      onPressed: (){

                                                        Navigator.of(ctx2).pop();
                                                      },
                                                      child: Text("Save Color", style: TextStyle(color: Colors.white, fontSize: 25),),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        );
                                      },
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        filled: true,
                                        isDense: true,
                                        fillColor: categoryColor,
                                        hintText: "Color",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 15,),
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
                                        onPressed: (){
                                          Category category = Category.empty;
                                          category.categoryId = const Uuid().v1();
                                          category.name = categoryNameController.text;
                                          category.icon = iconSelected;
                                          category.color = categoryColor.toString();
                                          context.read<CreateCategoryBloc>().add(CreateCategory(category));
                                          // Navigator.of(ctx).pop();
                                        },
                                        child: Text("Add", style: TextStyle(color: Colors.white, fontSize: 25),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      );
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )
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