# portfolio

## Build

- Upgrade version in `pubspec.yaml` like this: `0.9.0+1` -> `0.9.1+2`
- `flutter clean`
- `flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true`
- Commit either `v0.9.0` or `Deployed v0.9.0` (in case the build was refreshed)

## Deploy

- Currently deployed automatically as soon as a build is committed
