import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiAPIService {
  // ✅ Your working Gemini 2.0 Flash API Key
  final String apiKey = dotenv.env['GEMINI_API_KEY']!;

  // ✅ Function to get Gemini reply
  Future<String> getGeminiReply(String userMessage) async {
    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash-lite:generateContent',
    );

    final headers = {
      'Content-Type': 'application/json',
      'X-goog-api-key': apiKey,
    };

    final body = jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": userMessage}
          ]
        }
      ]
    });

    final response = await http.post(uri, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['candidates'][0]['content']['parts'][0]['text'];
    } else {
      print("❌ API Error [${response.statusCode}]: ${response.body}");
  return "❌ ${response.body}";
    }
  }
}
