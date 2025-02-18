import 'package:cloud_firestore/cloud_firestore.dart';

import '../../expense_repository.dart';

class ExpenseEntity{
  String expenseId;
  Category category;
  DateTime date;
  int amount;

  ExpenseEntity({
    required this.expenseId,
    required this.category,
    required this.amount,
    required this.date,
  });

  Map<String, Object?> toDocument() {
    return {
      'expenseId': expenseId,
      'category': category.toEntity().toDocument(),
      'amount': amount,
      'date': date,
    };
  }

  static ExpenseEntity fromDocument(Map<String, dynamic> doc) {
    return ExpenseEntity(
      expenseId: doc['expenseId'],
      category: Category.fromEntity(CategoryEntity.fromDocument(doc['category'])),
      amount: doc['amount'],
      date: (doc['date'] as Timestamp).toDate(),
    );
  }
}