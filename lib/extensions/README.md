# Dart Extensions

Demonstrates Dart extensions on built-in and custom types.

---

## 1. String extensions

```dart
extension StringExtensions on String {
  // Capitalizes the first letter of the string.

  // Example:
  //   'dart'.capitalize()  // 'Dart'
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  // Returns the string in reversed order.

  // Example:
  //   'dart'.reversed  // 'trad'
  String get reversed => split('').reversed.join();
}
```

---

## 2. Nullable String extension

```dart
extension NullableStringExtension on String? {
  // Returns the string itself, or an empty string if null.

  // Example:
  //   String? name = null;
  //   name.orEmpty  // ''
  String get orEmpty => this ?? '';
}
```

---

## 3. Custom class with extension

```dart
class Person {
  final String name;
  final String surname;
  final int age;

  const Person({required this.name, required this.surname, required this.age});
}

extension PersonExtensions on Person {
  // Returns the full name as 'Name Surname'.
  String get fullName => '$name $surname';

  // Returns true if the person is 18 or older.
  bool get isAdult => age >= 18;

  // Returns a short summary string.
  String get displayInfo => '$fullName is $age yrs old';
}
```

---

## Usage

```dart
void main() {
  // String extensions
  const text = 'dart';
  print(text.capitalize());          // Dart
  print(text.reversed);              // trad
  print(text.capitalize().reversed); // traD

  // Nullable string extension
  const String? nullText = null;
  print(nullText.orEmpty);           // (empty string)

  // Person extensions
  const person = Person(name: 'Bidisha', surname: 'Koirala', age: 22);
  print(person.fullName);    // Bidisha Koirala
  print(person.isAdult);     // true
  print(person.displayInfo); // Bidisha Koirala is 22 yrs old
}
```
---

## Summary
This demo shows how Dart extensions can:
1. Add **utility methods** to existing types without modifying them.
2. Extend **custom classes** with computed properties.
3. Keep code **clean, readable, and reusable**.