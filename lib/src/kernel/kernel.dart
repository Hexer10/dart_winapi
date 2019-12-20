import 'dart:ffi';

export 'get_last_error.dart';

/// User32.dll library
final dylib = DynamicLibrary.open('Kernel32.dll');
