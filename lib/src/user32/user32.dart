import 'dart:ffi';
export 'package:meta/meta.dart';

export 'call_next_hook_ex.dart';
export 'find_window_ex.dart';
export 'get_active_window.dart';
export 'get_cursor_pos.dart';
export 'get_desktop_window.dart';
export 'get_foreground_window.dart';
export 'get_key_state.dart';
export 'get_message.dart';
export 'get_window_text.dart';
export 'get_window_text_length.dart';
export 'keybd_event.dart';
export 'mouse_event.dart';
export 'register_hotkey.dart';
export 'send_input.dart';
export 'set_cursor_position.dart';
export 'set_windows_hook_ex.dart';
export 'show_window.dart';
export 'types.dart';
export 'unregister_hotkey.dart';

/// User32.dll library
final dylib = DynamicLibrary.open('User32.dll');
