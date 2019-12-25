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

typedef FindWindowExC = Pointer<Hwnd> Function(
    Pointer<Hwnd> hWndParent,
    Pointer<Hwnd> hWndChildAfter,
    Pointer<Utf8> lpszClass,
    Pointer<Utf8> lpszWindow);

typedef FindWindowExDart = Pointer<Hwnd> Function(
    Pointer<Hwnd> hWndParent,
    Pointer<Hwnd> hWndChildAfter,
    Pointer<Utf8> lpszClass,
    Pointer<Utf8> lpszWindow);

/// Retrieves a handle to a window whose class name and window name
/// match the specified strings.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-findwindowexa
Pointer<Hwnd> FindWindowEx(
    {Pointer<Hwnd> hWndParent,
    Pointer<Hwnd> hWndChildAfter,
    Pointer<Utf8> lpszClass,
    Pointer<Utf8> lpszWindow,
    TextFormat textFormat = TextFormat.utf16}) {
  hWndParent ??= nullptr;
  hWndChildAfter ??= nullptr;
  lpszClass ??= nullptr;
  lpszWindow ??= nullptr;

  var symbol =
      textFormat == TextFormat.utf16 ? 'FindWindowExW' : 'FindWindowExA';
  final FindWindowExP =
      dylib.lookupFunction<FindWindowExC, FindWindowExDart>(symbol);

  return FindWindowExP(hWndParent, hWndChildAfter, lpszClass, lpszWindow);
}
