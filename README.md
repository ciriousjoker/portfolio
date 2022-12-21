# portfolio

## Flutter version

- Flutter version is pinned via [Flutter Version Manger](https://fvm.app/) ([GUI: Flutter Sidekick](https://github.com/leoafarias/sidekick))

## Update models

`fvm flutter pub run build_runner build --delete-conflicting-outputs`

(or use VSCode Task)

## Modify assets

https://github.com/CiriousJoker/portfolio_assets

## Versioning

Upgrade version in `pubspec.yaml` like this: `0.9.0+1` -> `0.9.1+2`

## Add projects without full rebuild

- Edit `./assets/projects.json` with the new project
- Add image assets into `./assets` and `./build/web/assets/assets`

## Deploy

- Test the release: `flutter run -d chrome --release --web-renderer canvaskit`
- Commit the changes as `Deployed v1.2.3`
- [Deploy it](https://github.com/CiriousJoker/portfolio/actions/workflows/deploy.yml)
