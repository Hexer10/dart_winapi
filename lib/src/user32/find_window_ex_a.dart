import 'dart:ffi';
import 'package:ffi/ffi.dart';

import 'user32.dart';

/*
HWND FindWindowExA(
  HWND   hWndParent,
  HWND   hWndChildAfter,
  LPCSTR lpszClass,
  LPCSTR lpszWindow
);
 */

typedef FindWindowExAC = Pointer<Hwnd> Function(
    Pointer<Hwnd> hWndParent,
    Pointer<Hwnd> hWndChildAfter,
    Pointer<Utf8> lpszClass,
    Pointer<Utf8> lpszWindow);

typedef FindWindowExADart = Pointer<Hwnd> Function(
    Pointer<Hwnd> hWndParent,
    Pointer<Hwnd> hWndChildAfter,
    Pointer<Utf8> lpszClass,
    Pointer<Utf8> lpszWindow);

/// Retrieves a handle to a window whose class name and window name
/// match the specified strings.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-findwindowexa
Pointer<Hwnd> FindWindowExA(
    {Pointer<Hwnd> hWndParent,
    Pointer<Hwnd> hWndChildAfter,
    Pointer<Utf8> lpszClass,
    Pointer<Utf8> lpszWindow}) {
  hWndParent ??= nullptr;
  hWndChildAfter ??= nullptr;
  lpszClass ??= nullptr;
  lpszWindow ??= nullptr;

  final FindWindowExACP =
      dylib.lookupFunction<FindWindowExAC, FindWindowExADart>('FindWindowExA');

  return FindWindowExACP(hWndParent, hWndChildAfter, lpszClass, lpszWindow);
}
