import '../entities/category_entity.dart';

class Category{
  late String categoryId;
  late String name;
  late int total_expense;
  late String icon;
  late String color;

  Category({
    required this.categoryId,
    required this.name,
    required this.total_expense,
    required this.icon,
    required this.color
  });

  static final empty = Category(
    categoryId: '',
    name: '',
    total_expense: 0,
    icon: '',
    color: ''
  );

  CategoryEntity toEntity(){
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      total_expense: total_expense,
      icon: icon,
      color: color
    );
  }

  static Category fromEntity(CategoryEntity entity){
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      total_expense: entity.total_expense,
      icon: entity.icon,
      color: entity.color
    );
  }
}