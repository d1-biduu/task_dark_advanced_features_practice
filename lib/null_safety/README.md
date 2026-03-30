# Dart Null Safety

A quick look at how Dart handles null — what I learned and what I built.

---

## What is null safety?

In Dart, variables can't be null by default. You have to explicitly say a variable *can* be null by adding `?` to the type.

```dart
String name = 'Bidisha'; // can never be null
String? nickname;        // can be null
```

If you don't initialize a nullable variable, Dart gives it a default value of `null`.

```dart
int? age;
print(age); // null
```

---

## Null-aware operators

Small tools Dart gives you to handle null without crashing.

### `??` — if null, use a default

```dart
String? message;
final text = message ?? 'No message'; // 'No message'
```

### `??=` — assign only if null

```dart
double? fontSize;
fontSize ??= 20.0; // sets 20.0 since it was null
```

### `?.` 

Without ?., accessing a property on a null variable throws an error:

```dart

String? username = null;
username.toUpperCase(); // error — can't call method on null
```

With ?., it just returns null instead of crashing:

```dart
String? username = null;
username?.toUpperCase(); // null — no error

username = 'bidisha';
username?.toUpperCase(); // 'BIDISHA' — has a value, so it runs
```

Combined with ?? to provide a fallback:

```dart
final display = username?.toUpperCase() ?? 'Guest';
// username is null     → returns 'Guest'
// username is 'bidisha' → returns 'BIDISHA'
```


### `!` — null assertion operator

Use when you know for certain a value is not null and want to treat it as non-nullable.

```dart
String? value = 'hello';
String name = value!;
```

> Avoid using `!` unless you are absolutely sure the value is not null. If it is null at runtime, the app will crash.

---

## Initializing non-nullable fields in a class

Dart requires non-nullable fields to always have a value. There are a few ways to handle this.

### Using `required`

```dart
class User {
  final String name;
  User({required this.name});
}
```

### Using a default value

```dart
class User {
  final String name;
  User({this.name = 'anonymous'});
}
```

### Using a nullable field

```dart
class User {
  String? name; // optional — you handle null yourself
}
```


---

## Working with `freezed` — `@Default()`

In practice I've also worked with the `freezed` package, which builds on null safety. The `@Default()` annotation gives a field a fallback value so it never needs to be nullable.

```dart
@freezed
class User with _$User {
  const factory User({
    @Default('') String name,  // never null, falls back to ''
    @Default(0)  int age,      // never null, falls back to 0
  }) = _User;
}
```

This removes the need for `??` checks every time you use the field, since the value is guaranteed to never be null.

---

