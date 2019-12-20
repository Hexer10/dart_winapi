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
bool SetCursorPos(int x, int y) {
  final SetCursorPosP =
      dylib.lookupFunction<SetCursorPosC, SetCursorPosDart>('SetCursorPos');

  var result = SetCursorPosP(x, y);
  return result != 0;
}
