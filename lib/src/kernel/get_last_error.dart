import 'dart:ffi';

import 'kernel.dart';

typedef GetLastErrorC = Uint32 Function();

typedef GetLastErrorDart = int Function();

/// Get the current cursor position.
int GetLastError() {
  final GetLastErrorDarP =
      dylib.lookupFunction<GetLastErrorC, GetLastErrorDart>('GetLastError');

  return GetLastErrorDarP();
}
