import 'dart:ffi';

import 'user32.dart';

/*
int GetWindowTextA(
  HWND  hWnd,
  LPSTR lpString,
  int   nMaxCount
);
 */
typedef GetWindowTextLengthC = Uint32 Function(Pointer<Hwnd> hWnd);

typedef GetWindowTextLengthDart = int Function(Pointer<Hwnd> hWnd);

/// Retrieves the length, in characters, of the specified window's title bar
/// text (if the window has a title bar).
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getwindowtextlengtha
int GetWindowTextLength(Pointer<Hwnd> hWnd,
    {TextFormat textFormat = TextFormat.utf16}) {
  var symbol = textFormat == TextFormat.utf16
      ? 'GetWindowTextLengthW'
      : 'GetWindowTextLengthA';

  final GetWindowTextLengthAP = dylib
      .lookupFunction<GetWindowTextLengthC, GetWindowTextLengthDart>(symbol);

  return GetWindowTextLengthAP(hWnd);
}
