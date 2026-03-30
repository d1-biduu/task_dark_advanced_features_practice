# Performance Observation

This project demonstrates the impact of blocking the main isolate during heavyy computation.

### Without Isolates:
- CircularProgressIndicator  freezes during heavy computation
- UI becomes unresponsive until the task completes

### With Isolates:
- Heavy computation runs on a separate isolate
- CircularProgressIndicator continues animating smoothly without interruption

# Isolates in Dart

Dart is single-threaded by default, so long-running tasks can block the UI. Isolates solve this by moving heavy work away from the main thread.

Each isolate has its own memory and runs on separate thread.

## Key Concepts
1. No shared state between isolates.
2. Communication happens only throught message passing.

## Main Communication Tool:
1. SendPort => used to send messages
2. ReceivePort => used to receive messages

## Ways to use isolates in Dart

# Isolate.spawn
This is the lowest-level approach.
Use it when:

1. You need full control over execution
2. You want custom communication flow
3. You may need continuous or structured communication

You manually handle ports and message passing.

# compute(Flutter)

A simple utility helper provided by Flutter.

Use it when:

1. One-time expensive tasks

Pros:
1. Auto cleanup and easy to use

Cons:
1. Limited Control

Syntax:
```dart 
final result = await compute(task, input);
```
# Isolates.run(Dart 3+)
A modern alternative to compute.
Use it when: 
1. You need a single result back

Pros:
1. Auto cleanup and easy to use

Cons:
1. Limited Control

Syntax:
```dart 
 final result = await Isolate.run(() {
  return 42;
});
```
# Communication types

## One Way Communications
1. Worker isolate sends result back to main isolate
2. Main isolate only receives response
3. Common in compute and Isolate.run

## Two way Communications
1. Both isolates can send messages to each other
2. Requires manual setup using both SendPort and ReceivePort
3. Used in Isolate.spawn for advanced cases
4.  Useful for streaming updates or continuous processing


# Multiple Data Passing

Since isolates accept only one parameter, multiple values can be passed using:

## List
```dart
 Isolate.spawn(worker, [sendPort, 10, 20]);
```
## Map
```dart
Isolate.spawn(worker, {
  "port": sendPort,
  "a": 10,
  "b": 20,
});
```
# When to use what
1. Isolate.spawn → full control, complex background tasks, two-way communication
2. compute and  Isolate.run → simple one-time heavy tasks (most common in Flutter apps)


