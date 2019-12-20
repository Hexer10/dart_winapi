import 'dart:ffi';

export 'find_window_ex_a.dart';
export 'get_cursor_pos.dart';
export 'get_desktop_window.dart';
export 'get_window_text_a.dart';
export 'get_window_text_length_a.dart';
export 'hwnd.dart';
export 'keybd_event.dart';
export 'mouse_event.dart';
export 'send_input.dart';
export 'set_cursor_position.dart';


/// User32.dll library
final dylib = DynamicLibrary.open('User32.dll');
