# portfolio

## Flutter version

- Flutter version is pinned via [Flutter Version Manger](https://fvm.app/) ([GUI: Flutter Sidekick](https://github.com/leoafarias/sidekick))

## Update models

`fvm flutter pub run build_runner build --delete-conflicting-outputs`

(or use VSCode Task)

## Modify assets

https://github.com/CiriousJoker/portfolio_assets

## Add projects

- Edit `./assets/projects.json` with the new project
- Add image assets into `./assets`

## Versioning

Upgrade version in `pubspec.yaml` like this: `0.9.0+1` -> `0.9.1+2`

## Deploy

- Test the release:
  - `fvm flutter build web --release --csp --dart2js-optimization O4 --wasm` (use the command from `deploy.yml` if unsure)
  - `npx http-server ./build/web/`
- Commit the changes as `Deployed v1.2.3`
- [Deploy it](https://github.com/CiriousJoker/portfolio/actions/workflows/deploy.yml)
