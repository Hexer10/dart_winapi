import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'user32.dart';

/*
  HWND   hwnd;
  UINT   message;
  WPARAM wParam;
  LPARAM lParam;
  DWORD  time;
  POINT  pt;
  DWORD  lPrivate;
 */

/// Msg struct
class Msg extends Struct {
  Pointer<Hwnd> hwnd;

  @Uint32()
  int message;

  @Uint32()
  int lParam;

  @Uint32()
  int time;

  Pointer<Point> pt;

  @Uint32()
  int lPrivate;

  /// Allocate a new point.
  factory Msg.allocate() => allocate<Msg>().ref;
}

/*
 LPMSG lpMsg,
  HWND  hWnd,
  UINT  wMsgFilterMin,
  UINT  wMsgFilterMax
 */
typedef GetMessageC = Uint8 Function(Pointer<Msg> lpMsg, Pointer<Hwnd> hwnd,
    Uint32 wMsgFilterMin, Uint32 wMsgFilterMax);

typedef GetMessageDart = int Function(Pointer<Msg> lpMsg, Pointer<Hwnd> hwnd,
    int wMsgFilterMin, int wMsgFilterMax);

/// Get the current cursor position.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getcursorpos
bool GetMessage(Pointer<Msg> lpMsg, Pointer<Hwnd> hwnd, int wMsgFilterMin,
    int wMsgFilterMax) {
  final GetMessageP =
      dylib.lookupFunction<GetMessageC, GetMessageDart>('GetMessage');

  var result = GetMessageP(lpMsg, hwnd, wMsgFilterMin, wMsgFilterMax);
  return result != 0;
}
