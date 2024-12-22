```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        //More robust error handling by specifically catching FormatException
        return jsonDecode(response.body) as Map<String, dynamic>;
      } on FormatException catch (e) {
        print('Invalid JSON format: $e');
        return null; // Or handle the error as appropriate
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow; // Rethrow to allow higher levels to handle
  }
}
```