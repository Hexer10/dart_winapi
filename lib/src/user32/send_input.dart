/*
Long -> int32
Word -> uint16
DWord -> uint32
 */

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'user32.dart';

typedef SendInputC = Uint32 Function(
    Uint32 cInputs, Pointer pInputs, Int32 cbSize);

typedef SendInputDart = int Function(int inputCount, Pointer inputs, int size);

@experimental
/// Synthesizes keystrokes, mouse motions, and button clicks.
/// Not working.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-sendinput
int SendInput(int type, {MouseInput mi, KeyboardInput ki, HardwareInput hi}) {
  final SendInputP =
      dylib.lookupFunction<SendInputC, SendInputDart>('SendInput');

  var input = Input.allocate(
      type: type,
      mi: mi?.addressOf ?? nullptr,
      ki: ki?.addressOf ?? nullptr,
      hi: hi?.addressOf ?? nullptr);

  var result = SendInputP(1, input.addressOf, sizeOf<Input>());
  return result;
}

class Input extends Struct {
  @Uint32()
  int type;

  Pointer<MouseInput> mi;
  Pointer<KeyboardInput> ki;
  Pointer<HardwareInput> hi;

  factory Input.allocate(
          {int type,
          Pointer<MouseInput> mi,
          Pointer<KeyboardInput> ki,
          Pointer<HardwareInput> hi}) =>
      allocate<Input>().ref
        ..type = type
        ..mi = mi
        ..ki = ki
        ..hi = hi;
}

class MouseInput extends Struct {
  @Int32()
  int dx;

  @Int32()
  int dy;

  @Uint32()
  int mouseData;

  @Uint32()
  int dwFlags;

  @Uint32()
  int time;

  @Uint32()
  int dwExtraInfo;

  factory MouseInput.allocate(
          {int dx = 0,
          int dy = 0,
          int mouseData = 0,
          int dwFlags = 0,
          int time = 0,
          int dwExtraInfo = 0}) =>
      allocate<MouseInput>().ref
        ..dx = dx
        ..dy = dy
        ..mouseData = mouseData
        ..dwFlags = dwFlags
        ..time = time
        ..dwExtraInfo = dwExtraInfo;
}

class KeyboardInput extends Struct {
  @Uint16()
  int wVk;

  @Uint16()
  int wScan;

  @Uint32()
  int dwFlags;

  @Uint32()
  int time;

  @Uint32()
  int dwExtraInfo;

  factory KeyboardInput.allocate(
          {int wVk = 0,
          int wScan = 0,
          int dwFlags = 0,
          int time = 0,
          int dwExtraInfo = 0}) =>
      allocate<KeyboardInput>().ref
        ..wVk = wVk
        ..wScan = wScan
        ..dwFlags = dwFlags
        ..time = time
        ..dwExtraInfo = dwExtraInfo;
}

class HardwareInput extends Struct {
  @Uint32()
  int uMsg;

  @Uint16()
  int wParamL;

  @Uint16()
  int wParamH;

  factory HardwareInput.allocate(
          {int uMsg = 0, int wParamL = 0, int wParamH = 0}) =>
      allocate<HardwareInput>().ref
        ..uMsg = uMsg
        ..wParamL = wParamL
        ..wParamH = wParamH;
}
