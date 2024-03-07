class Advice {
  final int id;
  final String advice;

  Advice({required this.id, required this.advice});

  factory Advice.fromJson(Map<String, dynamic> json) {
    return Advice(
      id: json['id'],
      advice: json['advice'],
    );
  }
}
