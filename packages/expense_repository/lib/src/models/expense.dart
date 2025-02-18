import 'package:expense_repository/expense_repository.dart';

class Expense{
  String expenseId;
  Category category;
  DateTime date;
  int amount;

  Expense({
    required this.expenseId,
    required this.category,
    required this.amount,
    required this.date,
  });

  ExpenseEntity toEntity(){
    return ExpenseEntity(
        expenseId: expenseId,
        category: category,
        amount: amount,
        date: date,
    );
  }

  static Expense fromEntity(ExpenseEntity entity){
    return Expense(
        expenseId: entity.expenseId,
        category: entity.category,
        amount: entity.amount,
        date: entity.date,
    );
  }
}