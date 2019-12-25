import 'dart:ffi';
import 'package:ffi/ffi.dart';

import 'user32.dart';

/*
int GetWindowTextA(
  HWND  hWnd,
  LPSTR lpString,
  int   nMaxCount
);
 */
typedef GetWindowTextC = Uint32 Function(
    Pointer<Hwnd> hWnd, Pointer<Utf8> lpString, Uint32 nMaxCount);

typedef GetWindowTextDart = int Function(
    Pointer<Hwnd> hWnd, Pointer<Utf8> lpString, int nMaxCount);

/// Copies the text of the specified window's title bar
/// (if it has one) into a buffer.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getwindowtexta
int GetWindowText(Pointer<Hwnd> hWnd, Pointer<Utf8> lpString, int nMaxCount,
    {TextFormat textFormat = TextFormat.utf16}) {
  var symbol =
      textFormat == TextFormat.utf16 ? 'GetWindowTextW' : 'GetWindowTextA';

  final GetWindowTextAP =
      dylib.lookupFunction<GetWindowTextC, GetWindowTextDart>(symbol);

  return GetWindowTextAP(hWnd, lpString, nMaxCount);
}
