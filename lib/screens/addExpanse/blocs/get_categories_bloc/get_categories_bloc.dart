import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

part 'get_categories_event.dart';
part 'get_categories_state.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  GetCategoriesBloc() : super(GetCategoriesInitial()) {
    on<GetCategoriesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
