# Flutter Portfolio — Abdelrahman Nazeh

A Flutter Web version of the portfolio, matching the LinkedIn banner and
resume design (deep navy + teal, modular architecture motif).

⚠️ **This was written without a Flutter SDK available to test it.** The code
follows standard, stable Flutter APIs, but you should run it locally and
send back any error you hit — happy to fix immediately.

## 1. First-time setup

This project only ships `lib/`, `pubspec.yaml`, and `assets/` — the
platform folders (`web/`, `android/`, `ios/`, etc.) are missing on purpose,
because their exact template changes between Flutter versions. Generate
them locally so they match your installed SDK:

```bash
cd flutter_portfolio
flutter create .        # safe — fills in missing platform folders only
flutter pub get
```

## 2. Add your CV so the "Download CV" button works

Copy your CV PDF into the `web/` folder (created in step 1) and name it
exactly:

```
web/Abdelrahman_Nazeh_CV.pdf
```

## 3. Run it

```bash
flutter run -d chrome
```

## 4. Add real app screenshots

Each project card currently shows a placeholder ("Add screenshot"). To
swap one in:

1. Drop the image file into `assets/images/` (e.g. `weco_suite_1.png`)
2. Open `lib/widgets/projects_section.dart`
3. Find the matching `ProjectData(...)` entry and change:
   ```dart
   imageAsset: null,
   ```
   to:
   ```dart
   imageAsset: 'assets/images/weco_suite_1.png',
   ```
4. Hot-reload — the placeholder is replaced automatically.

Recommended: 16:10 landscape screenshots, ~1200px wide, PNG or JPG.

## 5. Deploy to GitHub Pages

```bash
flutter build web --base-href /your-repo-name/
```

Then push the contents of `build/web/` to a `gh-pages` branch (or use the
`peaceiris/actions-gh-pages` GitHub Action to automate it on every push to
`main`).

## Project structure

```
lib/
  core/            → colors, text styles, responsive breakpoints
  widgets/
    animated_module_map.dart   → the hero's signature animated diagram
    background_grid.dart       → faint fixed grid texture
    reveal_on_scroll.dart       → fade+slide-in on scroll (no external package)
    nav_bar.dart, hero_section.dart, about_section.dart,
    experience_section.dart, projects_section.dart, project_card.dart,
    skills_section.dart, contact_section.dart, footer_section.dart
    portfolio_home.dart         → ties every section together
  main.dart
assets/images/     → drop project screenshots here
```

## Design notes

- Palette and type scale match the LinkedIn banner and CV exactly, so all
  three surfaces read as one identity.
- The hero diagram (hub + 5 connected modules) is a literal callback to
  the CV bullet about architecting 5 independent feature modules around a
  shared service hub — not decoration for its own sake.
- Animations used: hero diagram draws itself in on load, sections
  fade+slide in on scroll (only once, not repeatedly), project cards lift
  on hover. Kept to these three so it feels intentional rather than busy.
