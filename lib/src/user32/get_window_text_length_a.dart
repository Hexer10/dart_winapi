import 'dart:ffi';

import 'user32.dart';

/*
int GetWindowTextA(
  HWND  hWnd,
  LPSTR lpString,
  int   nMaxCount
);
 */
typedef GetWindowTextLengthAC = Uint32 Function(Pointer<Hwnd> hWnd);

typedef GetWindowTextLengthADart = int Function(Pointer<Hwnd> hWnd);

/// Retrieves the length, in characters, of the specified window's title bar
/// text (if the window has a title bar).
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getwindowtextlengtha
int GetWindowTextLengthA(Pointer<Hwnd> hWnd) {
  final GetWindowTextLengthAP =
      dylib.lookupFunction<GetWindowTextLengthAC, GetWindowTextLengthADart>(
          'GetWindowTextLengthA');

  return GetWindowTextLengthAP(hWnd);
}
