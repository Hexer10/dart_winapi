import 'dart:ffi';

import 'package:dart_winapi/user32.dart';
import 'package:ffi/ffi.dart';

void main() {
  var point = Point.allocate();
  GetCursorPos(point);
  point.x += 10;
  SetCursorPos(point.x, point.y);
  MouseEvent(dwFlags: MOUSEEVENTF_LEFTDOWN);
  MouseEvent(dwFlags: MOUSEEVENTF_LEFTUP);
  free(point.addressOf);
}
