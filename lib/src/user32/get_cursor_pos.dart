import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'user32.dart';

/// Point struct
class Point extends Struct {
  /// Horizontal coordinate.
  @Int32()
  int x;

  /// Vertical coordinate.
  @Int32()
  int y;

  /// Allocate a new point.
  factory Point.allocate({int x = 0, int y = 0}) => allocate<Point>().ref
    ..x = x
    ..y = y;
}

typedef GetCursorC = Uint8 Function(Pointer<Point> point);

typedef GetCursorDart = int Function(Pointer<Point> point);

/// Get the current cursor position.
bool GetCursorPos(Point point) {
  final GetCursorP =
      dylib.lookupFunction<GetCursorC, GetCursorDart>('GetCursorPos');

  var result = GetCursorP(point.addressOf);
  return result != 0;
}
