import 'dart:ffi';

import 'user32.dart';

/*
HWND GetActiveWindow();
 */

typedef GetActiveWindowC = Pointer<Hwnd> Function();

typedef GetActiveWindowDart = Pointer<Hwnd> Function();

/// Retrieves the window handle to the active window attached
/// to the calling thread's message queue.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getactivewindow
Pointer<Hwnd> GetActiveWindow() {
  final GetActiveWindowP = dylib
      .lookupFunction<GetActiveWindowC, GetActiveWindowDart>('GetActiveWindow');

  var result = GetActiveWindowP();
  return result;
}
