part of 'create_expense_bloc.dart';

@override
sealed class CreateExpenseEvent {
  const CreateExpenseEvent();

  @override
  List<Object> get props => [];
}

class CreateExpense extends CreateExpenseEvent {
  final Expense expense;

  const CreateExpense(this.expense);

  @override
  List<Object> get props => [expense];
}
