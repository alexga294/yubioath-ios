# iOS application for TOTP generations with YubiKeys

This app is a stripped-down version of Yubico Authenticator (forked from version 1.7).
The app contains the following changes:
- Fix for password protected YubiKeys for iOS 15 (the original version of the app was not displaying the password textbox, due to alert limitations in iOS 15)
- Made app read-only - it only allows to generate TOTPs for existing accounts on a YubiKey, and doesn't allow to add/remove accounts.

The app is intended to be used as an offline TOTP authenticator on iOS15 devices, like iPod touch.

See the file LICENSE for copyright and license information.

## Development

This app is developed in Xcode and the only external dependency is the
[YubiKit iOS SDK](https://github.com/Yubico/yubikit-ios) which is added using
the Swift Package Manager. To build the app simply open the project file and hit
the build button.

