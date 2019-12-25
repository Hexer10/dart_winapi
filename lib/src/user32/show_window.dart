import 'dart:ffi';

import 'user32.dart';

/*
BOOL ShowWindow(
  HWND hWnd,
  int  nCmdShow
);
 */

typedef ShowWindowC = Uint8 Function(Pointer<Hwnd> hWnd, Int32 nCmdShow);

typedef ShowWindowDart = int Function(Pointer<Hwnd> hWnd, int nCmdShow);

/// Sets the specified window's show state.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-showwindow
bool ShowWindow({@required Pointer<Hwnd> hWnd, @required int nCmdShow}) {
  final ShowWindowP = dylib
      .lookupFunction<ShowWindowC, ShowWindowDart>('ShowWindow');

  var result = ShowWindowP(hWnd, nCmdShow);
  return result != 0;
}
