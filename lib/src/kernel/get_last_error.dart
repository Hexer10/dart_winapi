import 'dart:ffi';

import 'kernel.dart';

typedef GetLastErrorC = Uint32 Function();

typedef GetLastErrorDart = int Function();

/// Retrieves the calling thread's last-error code value.
/// See https://docs.microsoft.com/en-us/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror
int GetLastError() {
  final GetLastErrorDarP =
      dylib.lookupFunction<GetLastErrorC, GetLastErrorDart>('GetLastError');

  return GetLastErrorDarP();
}
