# flutter_plate_keyboard

A keyboard for entering the license plate number.

## Install

Add the following dependencies in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_plate_keyboard: ^${latestVersion}
```

> NOTE: Never forget to replace ^${latestVersion} with actual version.

## (Very) Basic usage 

```dart
  KeyboardController controller = KeyboardController();

  String openKeyBoard(){
    PlateKeyboard.show(controller: controller);
  }
```

## LICENSE

    MIT License
    
    Copyright 2022 OpenFlutter Project
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
