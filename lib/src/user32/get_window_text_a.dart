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
typedef GetWindowTextAC = Uint32 Function(
    Pointer<Hwnd> hWnd, Pointer<Utf8> lpString, Uint32 nMaxCount);

typedef GetWindowTextADart = int Function(
    Pointer<Hwnd> hWnd, Pointer<Utf8> lpString, int nMaxCount);

/// Copies the text of the specified window's title bar
/// (if it has one) into a buffer.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getwindowtexta
int GetWindowTextA(Pointer<Hwnd> hWnd, Pointer<Utf8> lpString, int nMaxCount) {
  final GetWindowTextAP = dylib
      .lookupFunction<GetWindowTextAC, GetWindowTextADart>('GetWindowTextA');

  return GetWindowTextAP(hWnd, lpString, nMaxCount);
}
