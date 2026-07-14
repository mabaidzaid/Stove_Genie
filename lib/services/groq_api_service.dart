import 'dart:convert';
import 'package:http/http.dart' as http;


class GroqAPIService {

  final String apiKey = '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';


  Future<String> getGroqReply(String userMessage) async {

    final uri = Uri.parse(
      'https://api.groq.com/openai/v1/chat/completions',
    );


    try {

      final response = await http.post(

        uri,

        headers: {

          'Content-Type': 'application/json',

          'Authorization':
              'Bearer $apiKey',

        },


        body: jsonEncode({

          "model": "llama-3.1-8b-instant",

          "messages": [

            {
              "role": "system",
              "content":
              """
You are Genie, the AI cooking assistant inside Stove Genie.

Only answer questions related to:
- recipes
- cooking
- ingredients
- meal planning
- nutrition

Give clear and helpful cooking advice.
"""
            },

            {
              "role": "user",
              "content": userMessage
            }

          ],

          "temperature": 0.7

        }),

      );


      if(response.statusCode == 200){

        final data = jsonDecode(response.body);


        return data['choices'][0]['message']['content'];

      }

      else {

        print(
          "Groq API Error ${response.statusCode}"
        );

        print(response.body);


        return "Sorry, Genie could not respond.";

      }


    } catch(e){

      print("Groq Exception: $e");

      return "Something went wrong.";

    }

  }

}