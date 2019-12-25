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
int SendInput(
    {@required int type, MouseInput mi, KeyboardInput ki, HardwareInput hi}) {
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
