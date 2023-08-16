
class CoffeeCategory {
  final String categoryName;
  final bool selected;

  CoffeeCategory({required this.categoryName, required this.selected});

  CoffeeCategory copyWith(bool selected) =>
      CoffeeCategory(categoryName: categoryName, selected: selected);
}
