# portfolio

## Build

- Upgrade version in `pubspec.yaml`
- Commit either `v0.9.0` or `Deployed v0.9.0` (in case the build was refreshed)
- `flutter clean`
- `flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true`

## Deploy

- Currently deployed automatically as soon as a build is committed
