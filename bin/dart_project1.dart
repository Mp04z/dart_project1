import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  await addexpense();
}

void login() {}

void showmenu() {}

void showall() {}

void showtoday() {}

Future<void> addexpense() async {
  print('======== Add new item ========');
  stdout.write('Item: ');
  String? item = stdin.readLineSync();
  stdout.write('Paid: ');
  String? paid = stdin.readLineSync();

  if (item != null && paid != null) {
    // Send to backend
    final response = await http.post(
      Uri.parse('http://localhost:3000/addexpense'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"item": item, "paid": int.parse(paid)}),

    );

    if (response.statusCode == 200) {
      print("Inserted");
    } else {
      print("⚠️ Failed to add expense: ${response.body}");
    }
  } else {
    print('⚠️ Item or Paid cannot be empty.');
  }
}

void deleteexpense() {}
