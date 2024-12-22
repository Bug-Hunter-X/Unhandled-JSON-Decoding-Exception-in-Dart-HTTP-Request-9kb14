```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Here's where the bug is.  Assuming the response body is JSON,
      // you need to parse it.
      final jsonResponse = jsonDecode(response.body);
      // Process the jsonResponse
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle the exception, but make sure you are catching the right exception type
    print('Error: $e');
    rethrow; //Rethrow to propagate it up the call stack
  }
}
```