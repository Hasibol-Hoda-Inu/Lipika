class CategoryModel {
  final String id;
  final String name;
  final String slug;
  final int sortOrder;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.sortOrder,
  });

  factory CategoryModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      sortOrder: json['sort_order'] as int? ?? 0,
    );
  }
}
