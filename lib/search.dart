import 'dart:io';

// mock ข้อมูล สำหรับทดสอบ search เท่านั้น
List<Map<String, dynamic>> expenses = [
  {'id': 1, 'item': 'lunch', 'paid': 70, 'date': '2025-08-20 12:07:33.000'},
  {'id': 2, 'item': 'coffee', 'paid': 45, 'date': '2025-08-20 13:07:33.000'},
  {'id': 3, 'item': 'rent', 'paid': 1600, 'date': '2025-08-01 07:26:53.000'},
  {'id': 4, 'item': 'lunch', 'paid': 50, 'date': '2025-08-20 13:27:39.000'},
  {'id': 5, 'item': 'bun', 'paid': 20, 'date': '2025-08-20 21:02:36.000'},
  {'id': 6, 'item': 'shoes', 'paid': 199, 'date': '2025-08-20 22:28:11.000'},
];

void main() {
  searchExpense();
}

// ฟังก์ชัน Search (หน้าที่ของ Pakkard)
void searchExpense() {
  stdout.write('Item to search: ');
  String searchTerm = stdin.readLineSync() ?? '';

  List<Map<String, dynamic>> foundItems = expenses.where((expense) {
    return expense['item'].toString().toLowerCase().contains(searchTerm.toLowerCase());
  }).toList();

  if (foundItems.isNotEmpty) {
    foundItems.forEach((item) {
      print('${item['id']}. ${item['item']} : ${item['paid']}฿ : ${item['date']}');
    });
  } else {
    print('No item: $searchTerm');
  }
}
