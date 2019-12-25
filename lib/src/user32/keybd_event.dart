import 'dart:ffi';

import 'user32.dart';

/*
  BYTE      bVk,
  BYTE      bScan,
  DWORD     dwFlags,
  ULONG_PTR dwExtraInfo
 */
typedef KeybdEventC = Void Function(
  Uint8 bVk,
  Uint8 bScan,
  Uint32 dwFlags,
  Uint32 dwExtraInfo,
);

typedef KeybdEventDart = void Function(
  int bVk,
  int bScan,
  int dwFlags,
  int dwExtraInfo,
);

/// Alias to [KeybdEvent]
// ignore: constant_identifier_names
const KeyBoardEvent = KeybdEvent;

/// Synthesises a keystore.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-keybd_event
void KeybdEvent({
  @required int bVk,
  int bScan = 0,
  int dwFlags = 0,
  int dwExtraInfo = 0,
}) {
  final KeybdEventP =
      dylib.lookupFunction<KeybdEventC, KeybdEventDart>('keybd_event');

  KeybdEventP(bVk, bScan, dwFlags, dwExtraInfo);
}
