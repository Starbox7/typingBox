class Position {
  final String position;

  const Position({required this.position});

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        position: json['position'] as String,
      );
}
