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

  @Int32()
  int wParam;

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
    Uint32 wMsgFilterMin, Uint64 wMsgFilterMax);

typedef GetMessageDart = int Function(Pointer<Msg> lpMsg, Pointer<Hwnd> hwnd,
    int wMsgFilterMin, int wMsgFilterMax);

/// Get message
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getmessage
bool GetMessage(Pointer<Msg> lpMsg, Pointer<Hwnd> hwnd, int wMsgFilterMin,
    int wMsgFilterMax,
    {TextFormat textFormat = TextFormat.utf16}) {
  var symbol = textFormat == TextFormat.utf16 ? 'GetMessageW' : 'GetMessageA';
  final GetMessageP = dylib.lookupFunction<GetMessageC, GetMessageDart>(symbol);

  var result = GetMessageP(lpMsg, hwnd, wMsgFilterMin, wMsgFilterMax);
  return result != 0;
}
