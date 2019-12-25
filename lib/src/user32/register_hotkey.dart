import 'dart:ffi';

import 'package:meta/meta.dart';
import 'user32.dart';

/*
BOOL RegisterHotKey(
  HWND hWnd,
  int  id,
  UINT fsModifiers,
  UINT vk
);
 */

typedef RegisterHotKeyC = Uint8 Function(
    Pointer<Hwnd> hWnd, Int32 id, Uint32 fsModifiers, Uint32 vk);

typedef RegisterHotKeyDart = int Function(
    Pointer<Hwnd> point, int id, int fsModifiers, int vk);

/// Defines a system-wide hot key.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-registerhotkey
bool RegisterHotKey(
    {@required int vk, Pointer<Hwnd> hWnd, int id = 1, int fsModifiers = 0}) {
  ArgumentError.checkNotNull(vk);
  hWnd ??= nullptr;

  final RegisterHotKeyP = dylib
      .lookupFunction<RegisterHotKeyC, RegisterHotKeyDart>('RegisterHotKey');

  var result = RegisterHotKeyP(hWnd, id, fsModifiers, vk);
  return result != 0;
}
