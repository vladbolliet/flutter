import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ClaudeService {
  final String _baseUrl = 'https://api.anthropic.com/v1/messages';
  final String _apiKey = 'YOUR-ANTHROPIC-API-KEY-HERE';

  Future<String> analyzeImage(File image) async {
    // Prepare image for Claude
    final bytes = await image.readAsBytes();
    final base64Image = base64Encode(bytes);

    // Send request to Claude
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': _apiKey,
        'anthropic-version': '2023-06-01'
      },
      body: jsonEncode({
        'model': 'claude-3-opus-20240229',
        'max_tokens': 100,
        'messages': [
          {
            'role': 'user',
            'content': [
              {
                'type': 'image',
                'source': {
                  'type': 'base64',
                  'media_type': 'image/jpeg',
                  'data': base64Image
                }
              },
              {
                'type': 'text',
                'text': 'Please describe briefly what you see in this image'
              }
            ]
          }
        ]
      }),

    );

    // Check for a successful response
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data['content'][0]['text'];
    }

    // Handle error
    throw Exception('Failed to analyse image. Status code: ${response.statusCode}, Response: ${response.body}');
  }
}
