# PROJECT DISCONTINUED
##### Use https://pub.dev/packages/win32

# Dart WinApi

Dart implementation of the Win32 Api https://docs.microsoft.com/en-us/windows/win32/

Documentation of the functions are taken from the official documentation.

# How to use

You can import a single part of the library such as `user32.dart` or import all the api function importing `dart_winapi.dart`

## Example

Get cursor position, set it and send left click input and release.
```dart
  var point = Point.allocate();
  GetCursorPos(point: point);
  point.x += 10;
  SetCursorPosFromPoint(point);
  MouseEvent(dwFlags: MOUSEEVENTF_LEFTDOWN);
  MouseEvent(dwFlags: MOUSEEVENTF_LEFTUP);
  free(point.addressOf);
```
<hr>

To request a new api function to be added please open a new issue.


