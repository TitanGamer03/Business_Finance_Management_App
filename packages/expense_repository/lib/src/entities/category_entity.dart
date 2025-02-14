class CategoryEntity {
  late String categoryId;
  late String name;
  late int total_expense;
  late String icon;
  late String color;

  CategoryEntity({
    required this.categoryId,
    required this.name,
    required this.total_expense,
    required this.icon,
    required this.color
  });

  Map<String, Object?> toDocument() {
    return {
      'categoryId': categoryId,
      'name': name,
      'total_expense': total_expense,
      'icon': icon,
      'color': color,
    };
  }

  static CategoryEntity fromDocument(Map<String, dynamic> doc) {
    return CategoryEntity(
      categoryId: doc['categoryId'],
      name: doc['name'],
      total_expense: doc['total_expense'],
      icon: doc['name'],
      color: doc['color'],
    );
  }
}