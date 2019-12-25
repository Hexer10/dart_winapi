import 'dart:ffi';

import 'user32.dart';

typedef GetCursorC = Uint8 Function(Pointer<Point> point);

typedef GetCursorDart = int Function(Pointer<Point> point);

/// Get the current cursor position.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getcursorpos
bool GetCursorPos({@required Point point}) {
  final GetCursorP =
      dylib.lookupFunction<GetCursorC, GetCursorDart>('GetCursorPos');

  var result = GetCursorP(point.addressOf);
  return result != 0;
}
