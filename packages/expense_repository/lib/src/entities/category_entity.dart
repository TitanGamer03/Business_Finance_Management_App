class CategoryEntity {
  String categoryId;
  String name;
  int totalExpense;
  String icon;
  int color;

  CategoryEntity({
    required this.categoryId,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color
  });

  Map<String, Object?> toDocument() {
    return {
      'categoryId': categoryId,
      'name': name,
      'total_expense': totalExpense,
      'icon': icon,
      'color': color,
    };
  }

  static CategoryEntity fromDocument(Map<String, dynamic> doc) {
    return CategoryEntity(
      categoryId: doc['categoryId'],
      name: doc['name'],
      totalExpense: doc['total_expense'],
      icon: doc['name'],
      color: doc['color'],
    );
  }
}