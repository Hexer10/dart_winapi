import 'dart:ffi';

import 'user32.dart';

/*
  DWORD     dwFlags,
  DWORD     dx,
  DWORD     dy,
  DWORD     dwData,
  ULONG_PTR dwExtraInfo
 */

/// mouse move
const MOUSEEVENTF_MOVE = 0x0001;

/// left button down
const MOUSEEVENTF_LEFTDOWN = 0x0002;

/// left button up
const MOUSEEVENTF_LEFTUP = 0x0004;

/// right button down
const MOUSEEVENTF_RIGHTDOWN = 0x0008;

/// right button up
const MOUSEEVENTF_RIGHTUP = 0x0010;

/// middle button down
const MOUSEEVENTF_MIDDLEDOWN = 0x0020;

/// middle button up
const MOUSEEVENTF_MIDDLEUP = 0x0040;

/// x button down
const MOUSEEVENTF_XDOWN = 0x0080;

/// x button up
const MOUSEEVENTF_XUP = 0x0100;

/// wheel button rolled
const MOUSEEVENTF_WHEEL = 0x0800;

///  map to entire virtual desktop
const MOUSEEVENTF_VIRTUALDESK = 0x4000;

/// absolute move
const MOUSEEVENTF_ABSOLUTE = 0x8000;

typedef MouseEventC = Void Function(
  Uint32 dwFlags,
  Uint32 dx,
  Uint32 dy,
  Uint32 dwData,
  Uint32 dwExtraData,
  Uint32 dwExtraInfo,
);

typedef MouseEventDart = void Function(
  int dwFlags,
  int dx,
  int dy,
  int dwData,
  int dwExtraData,
  int dwExtraInfo,
);

/// Synthesizes mouse motion and button clicks.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-mouse_event
void MouseEvent(
    {int dwFlags = 0,
    int dx = 0,
    int dy = 0,
    int dwData = 0,
    int dwExtraData = 0,
    int dwExtraInfo = 0}) {
  final MouseEventP =
      dylib.lookupFunction<MouseEventC, MouseEventDart>('mouse_event');

  MouseEventP(dwFlags, dx, dy, dwData, dwExtraData, dwExtraInfo);
}
