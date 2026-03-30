// 1. String extensions

extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get reversed => split('').reversed.join();
}

// ── 2. Nullable String extension

extension NullableStringExtension on String? {
  String get orEmpty => this ?? '';
}

// ── 3. Custom class with extension

class Person {
  final String name;
  final String surname;
  final int age;

  const Person({required this.name, required this.surname, required this.age});
}

extension PersonExtensions on Person {
  String get fullName => '$name $surname';

  bool get isAdult => age >= 18;

  String get displayInfo => '$fullName is $age yrs old';
}
