import 'dart:ffi';
import 'user32.dart';

typedef GetDesktopWindowC = Pointer<Hwnd> Function();

typedef GetDesktopWindowDart = Pointer<Hwnd> Function();

/// Retrieves a handle to the desktop window.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getdesktopwindow
Pointer<Hwnd> GetDesktopWindow() {
  final GetDesktopWindowP =
      dylib.lookupFunction<GetDesktopWindowC, GetDesktopWindowDart>(
          'GetDesktopWindow');

  return GetDesktopWindowP();
}
