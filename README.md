# portfolio

## Update models

`flutter pub run build_runner build`

## Versioning

Upgrade version in `pubspec.yaml` like this: `0.9.0+1` -> `0.9.1+2`

## Add projects without full rebuild
- Edit `./assets/projects.json` with the new project
- Add image assets into `./assets` and `./build/web/assets/assets`

## Deploy

- Commit the changes as `v0.9.0`
- `flutter clean`
- `flutter build web --release --web-renderer canvaskit --csp`
- Commit the `./build` folder as `Deployed v0.9.0`
- The live version of the website is deployed automatically
