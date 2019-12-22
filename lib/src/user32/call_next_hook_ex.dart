import 'dart:ffi';

import 'user32.dart';

/*
LRESULT CallNextHookEx(
  HHOOK  hhk,
  int    nCode,
  WPARAM wParam,
  LPARAM lParam
);
 */
typedef CallNextHookExC = Uint32 Function(
  Pointer hhk,
  Uint32 nCode,
  Uint32 wParam,
  Uint32 lParam,
);

typedef CallNextHookExDart = int Function(
  Pointer hhk,
  int nCode,
  int wParam,
  int lParam,
);

/// Passes the hook information to the next hook procedure
///in the current hook chain.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-callnexthookex
int CallNextHookEx(Pointer hhk, int nCode, int wParam, int lParam) {
  final CallNextHookExP = dylib
      .lookupFunction<CallNextHookExC, CallNextHookExDart>('CallNextHookEx');

  var result = CallNextHookExP(hhk, nCode, wParam, lParam);
  return result;
}
