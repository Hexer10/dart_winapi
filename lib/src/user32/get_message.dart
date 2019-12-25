import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
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

/// Retrieves a message from the calling thread's message queue.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getmessage
bool GetMessage(
    {@required Pointer<Msg> lpMsg,
    Pointer<Hwnd> hwnd,
    int wMsgFilterMin = 0,
    int wMsgFilterMax = 0,
    TextFormat textFormat = TextFormat.utf16}) {
  hwnd ??= nullptr;
  var symbol = textFormat == TextFormat.utf16 ? 'GetMessageW' : 'GetMessageA';
  final GetMessageP = dylib.lookupFunction<GetMessageC, GetMessageDart>(symbol);

  var result = GetMessageP(lpMsg, hwnd, wMsgFilterMin, wMsgFilterMax);
  return result != 0;
}
