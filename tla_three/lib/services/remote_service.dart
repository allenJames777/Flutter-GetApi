import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tla_three/models/json_card.dart';

class AdviceService {
  Future<Advice?> fetchRandomAdvice() async {
    final response =
        await http.get(Uri.parse('https://api.adviceslip.com/advice'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Advice.fromJson(data['slip']);
    } else {
      throw Exception('Failed to load advice');
    }
  }
}
