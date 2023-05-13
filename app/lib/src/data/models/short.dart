class Short {
  final String short;

  const Short({required this.short});

  factory Short.fromJson(Map<String, dynamic> json) => Short(
        short: json['short'] as String,
      );
}
