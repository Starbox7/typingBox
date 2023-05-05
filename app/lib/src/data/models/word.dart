class Word {
  final String word;

  const Word({required this.word});

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        word: json['word'] as String,
      );
}
