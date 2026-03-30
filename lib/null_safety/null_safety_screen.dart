// null_safety.dart
// Demonstrates Dart null safety concepts

// ── 1. Nullable vs non-nullable

void nullableVsNonNullable() {
  String name = 'Bidisha'; // can never be null
  String? nickname; // can be null — defaults to null

  print(name); // Bidisha
  print(nickname); // null
}

// ── 2. ?? — if null, use a default

void ifNullOperator() {
  String? message;
  final text = message ?? 'No message';

  print(text); // No message
}

// ── 3. ??= — assign only if null

void nullAwareAssignment() {
  double? fontSize;
  List<String>? fruits;
  Map<String, int?>? scores;
  fontSize ??= 20.0;
  fruits ??= [];
  scores ??= {};

  print(fontSize); // 20.0
  print(fruits); // []
  print(scores); // {}
}

// ── 4. ?. —

void nullAwareAccess() {
  String? username = null;
  print(username?.toUpperCase()); // null — no error

  final display = username?.toUpperCase() ?? 'Guest';
  print(display); // Guest

  username = 'bidisha';
  print(username?.toUpperCase()); // BIDISHA
}

// ── 5. ! — null assertion operator

void nullAssertion() {
  String? value = 'hello';
  String name = value!; // hello

  print(name); // hello
}

// ── 6. Class with non-nullable fields

class UserRequired {
  final String name;
  UserRequired({required this.name});
}

class UserDefault {
  final String name;
  UserDefault({this.name = 'anonymous'});
}

class UserNullable {
  String? name; //  handle yourselff
}

void classExamples() {
  final a = UserRequired(name: 'Bidisha');
  final b = UserDefault();
  final c = UserNullable();

  print(a.name); // Bidisha
  print(b.name); // anonymous
  print(c.name); // null
}

void main() {
  nullableVsNonNullable();
  ifNullOperator();
  nullAwareAssignment();
  nullAwareAccess();
  nullAssertion();
  classExamples();
}
