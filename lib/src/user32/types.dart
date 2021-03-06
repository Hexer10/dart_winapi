import 'dart:ffi';

import 'package:ffi/ffi.dart';

/// Handle type.
class Hwnd extends Struct {}

/// HHook type
class HHook extends Struct {}

/// Point struct
class Point extends Struct {
  /// Horizontal coordinate.
  @Int32()
  int x;

  /// Vertical coordinate.
  @Int32()
  int y;

  /// Allocate a new point.
  factory Point.allocate({int x = 0, int y = 0}) => allocate<Point>().ref
    ..x = x
    ..y = y;
}

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

/// TextFormat, ansi will use *A functions and utf18 *W functions.
enum TextFormat {
  /// Ansi format.
  ansi,

  /// Utf16 format.
  utf16
}
