import 'dart:ffi';

import 'user32.dart';

typedef GetKeyStateC = Int16 Function(
  Uint32 nVirtKey,
);

typedef GetKeyStateDart = int Function(
  int nVirtKey,
);

/// Retrieves the status of the specified virtual key.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getkeystate
int GetKeyState(int nVirtKey) {
  final GetKeyStateP =
      dylib.lookupFunction<GetKeyStateC, GetKeyStateDart>('GetKeyState');

  var result = GetKeyStateP(nVirtKey);
  return result;
}
