import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

const String baseUrl = "http://localhost:3000";
String? loggedInUserId;
void main() {
  login();
}

Future<void> login() async {
  print("===== Login =====");

  stdout.write("Username: ");
  String? username = stdin.readLineSync()?.trim();
  stdout.write("Password: ");
  String? password = stdin.readLineSync()?.trim();

  if (username == null || password == null || username.isEmpty || password.isEmpty) {
    print("Incomplete input");
    return;
  }

  final body = {"username": username, "password": password};
  final url = Uri.parse('$baseUrl/login');
  final response = await http.post(url, body: body);

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    print(" ${result['message']}");
    loggedInUserId = result['userId'].toString();
    showmenu();
  } else {
    final result = jsonDecode(response.body);
    print(" ${result['message']}");
  }
}

void showmenu() {}

void showall() {}

void showtoday() {}

void addexpense() {}

void deleteexpense() {}
