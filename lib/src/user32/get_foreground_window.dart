import 'dart:ffi';

import 'user32.dart';

/*
HWND GetForegroundWindow();
 */

typedef GetForegroundWindowC = Pointer<Hwnd> Function();

typedef GetForegroundWindowDart = Pointer<Hwnd> Function();

/// Retrieves a handle to the foreground window
/// (the window with which the user is currently working).
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getforegroundwindow
Pointer<Hwnd> GetForegroundWindow() {
  final GetForegroundWindowP =
      dylib.lookupFunction<GetActiveWindowC, GetActiveWindowDart>(
          'GetForegroundWindow');

  var result = GetForegroundWindowP();
  return result;
}
