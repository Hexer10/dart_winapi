import 'dart:ffi';

import 'package:meta/meta.dart';

import 'user32.dart';

//
/*
HHOOK SetWindowsHookExA(
  int       idHook,
  HOOKPROC  lpfn,
  HINSTANCE hmod,
  DWORD     dwThreadId
);
 */

typedef SetWindowsHookExAC = Pointer<HHook> Function(
  Uint32 code,
  Pointer<NativeFunction<HookprocC>> lpfn,
  Pointer hmod,
  Uint32 dwThreadId,
);

typedef SetWindowsHookExADart = Pointer<HHook> Function(
  int code,
  Pointer<NativeFunction<HookprocC>> lpfn,
  Pointer hmod,
  int dwThreadId,
);

/*
LRESULT Hookproc(
  int code,
  WPARAM wParam,
  LPARAM lParam
)
 */
typedef HookprocC = Uint32 Function(
  Int32 code,
  Uint32 wParam,
  Uint32 lParam,
);

typedef HookprocDart = int Function(
  int code,
  int wParam,
  int lParam,
);

const _expReturn = -1;

/// Installs an application-defined hook procedure into a hook chain.
/// See https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setwindowshookexa
@experimental
@alwaysThrows
Pointer<HHook> SetWindowsHookEx(
    {@required int idHook,
    @required HookprocDart callback,
    Pointer hmod,
    int dwThreadId = 0,
    TextFormat textFormat = TextFormat.utf16}) {
  throw UnimplementedError('SetWindowsHookEx is not yet implemented');
/*  var symbol = textFormat == TextFormat.utf16
      ? 'SetWindowsHookExW'
      : 'SetWindowsHookExA';
  hmod ??= nullptr;
  var cb;
//  var cb = Pointer.fromFunction<HookprocC>(callback, _expReturn);
  final SetWindowsHookExP =
      dylib.lookupFunction<SetWindowsHookExAC, SetWindowsHookExADart>(symbol);

  var result = SetWindowsHookExP(idHook, cb, hmod, dwThreadId);
  return result;*/
}
