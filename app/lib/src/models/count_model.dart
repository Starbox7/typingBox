enum Category { init, position, word, short }

class CountModel {
  int count;
  int max;
  int total;
  Category category;

  CountModel({
    required this.count,
    required this.max,
    required this.total,
    required this.category,
  });
}
