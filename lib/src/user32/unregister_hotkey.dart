import 'dart:ffi';

import 'package:meta/meta.dart';
import 'user32.dart';

/*
BOOL UnregisterHotKey(
  HWND hWnd,
  int  id
);
 */

typedef UnregisterHotKeyC = Uint8 Function(Pointer<Hwnd> hWnd, Int32 id);

typedef UnregisterHotKeyDart = int Function(Pointer<Hwnd> point, int id);

/// Frees a hot key previously registered by the calling thread.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-unregisterhotkey
bool UnregisterHotKey({@required int id, Pointer<Hwnd> hWnd}) {
  ArgumentError.checkNotNull(id);
  hWnd ??= nullptr;

  final UnregisterHotKeyP =
      dylib.lookupFunction<UnregisterHotKeyC, UnregisterHotKeyDart>(
          'UnregisterHotKey');

  var result = UnregisterHotKeyP(hWnd, id);
  return result != 0;
}
