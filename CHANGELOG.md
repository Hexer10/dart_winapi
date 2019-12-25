## 0.0.1

- Initial version, created by Stagehand

## 0.0.2

- Added GetKeyState

## 0.1.0

- Added CallNextHookEx
- Added GetMessage
- Added SetWindowsHookExA (still experimental)

## 0.2.0 Breaking changes

- Renamed some function to don't include the `A` prefix, and added the textFormat parameter to chose between either utf16 or ascii
- Added RegisterHotKey
- Disable SetWindowHook which cause the entire library to fail


## 0.3.0 Breaking changes

- Changed api to use optional named parameters
- Added short hand to set the cursor position given a point struct