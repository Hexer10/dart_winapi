import 'dart:ffi';

import 'user32.dart';

typedef SetCursorPosC = Uint8 Function(
  Uint32 x,
  Int32 y,
);

typedef SetCursorPosDart = int Function(
  int x,
  int y,
);

/// Set the cursor position
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setcursorpos
bool SetCursorPos({@required int x, @required int y}) {
  final SetCursorPosP =
      dylib.lookupFunction<SetCursorPosC, SetCursorPosDart>('SetCursorPos');

  var result = SetCursorPosP(x, y);
  return result != 0;
}

/// Set the cursor position given a point structure.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setcursorpos
bool SetCursorPosFromPoint({Point point}) =>
    SetCursorPos(x: point.x, y: point.y);
