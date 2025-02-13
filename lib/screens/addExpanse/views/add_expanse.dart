import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class AddExpanse extends StatefulWidget {
  const AddExpanse({super.key});

  @override
  State<AddExpanse> createState() => _AddExpanseState();
}

class _AddExpanseState extends State<AddExpanse> {

  bool isExpanded = false;
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
                onTap: (){

                },
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
                          return AlertDialog(
                            title: const Text("Create Category"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  // controller: dateController,
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

                                SizedBox(height: 15,),
                                TextFormField(
                                  readOnly: true,
                                  onTap: (){
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    filled: true,
                                    suffix: IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: (){
                                      setState(() {
                                        isExpanded = !isExpanded;
                                      });
                                    },),
                                    fillColor: Colors.white,
                                    hintText: "Icon",
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),

                                isExpanded ? Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
                                  ),
                                  child: ListView.builder(
                                    itemCount: iconList.length,
                                    itemBuilder: (context, int i) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(iconList[i]),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ) : Container(),

                                SizedBox(height: 15,),
                                TextFormField(
                                  // controller: dateController,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    fillColor: Colors.white,
                                    hintText: "Color",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ],
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