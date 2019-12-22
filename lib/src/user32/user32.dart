import 'dart:ffi';

export 'call_next_hook_ex.dart';
export 'find_window_ex_a.dart';
export 'get_cursor_pos.dart';
export 'get_desktop_window.dart';
export 'get_key_state.dart';
export 'get_message.dart';
export 'get_window_text_a.dart';
export 'get_window_text_length_a.dart';
export 'hwnd.dart';
export 'keybd_event.dart';
export 'mouse_event.dart';
export 'send_input.dart';
export 'set_cursor_position.dart';
export 'set_windows_hook_ex_a.dart';

/// User32.dll library
final dylib = DynamicLibrary.open('User32.dll');
