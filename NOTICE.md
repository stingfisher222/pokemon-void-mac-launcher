# Third-Party Notices

This launcher bundles and redistributes the following third-party software. Each component retains its original license. The bundled `Pokemon Void.app` (distributed via GitHub Releases, not in this repo's git tree) contains binary copies of these components.

---

## MKXP-Z

- **Role in this distribution**
  - The `Z-universal` Mach-O binary inside `Pokemon Void.app/Contents/MacOS/`
  - The Ruby 3.1.0 runtime and standard library inside `Pokemon Void.app/Contents/Resources/Ruby/`
  - The `liberation.ttf` fallback font inside `Pokemon Void.app/Contents/Resources/Assets.bundle/`
  - All shader files inside `Pokemon Void.app/Contents/Resources/Assets.bundle/Contents/Resources/Shaders/` (including the 5 KGL shaders also exposed under [`patches/kgl-shaders/`](patches/kgl-shaders/) in this repo)
  - The `icon.icns`, `icon.png`, `settingsmenu.nib`, `gamecontrollerdb.txt`, and `_CodeSignature/` files inside the same bundle

- **Upstream source**
  - Repository: <https://github.com/mkxp-z/mkxp-z>
  - **Exact commit shipped**: [`1f412ce980dc9a25b9aa6c5d0161ca6a8714e953`](https://github.com/mkxp-z/mkxp-z/tree/1f412ce980dc9a25b9aa6c5d0161ca6a8714e953) (May 7, 2026)
  - Binary obtained from that commit's `autobuild.yml` GitHub Actions run, artifact `mkxp-z.macos.dev-1f412ce` (run id `25487201394`)

- **License**: GNU General Public License, version 2 or any later version. Full text in [`third-party/mkxp-z/COPYING`](third-party/mkxp-z/COPYING).

- **Copyright**: Copyright © Amaryllis Kulla and the MKXP / MKXP-Z contributors. Original README preserved at [`third-party/mkxp-z/README.upstream.md`](third-party/mkxp-z/README.upstream.md).

- **Written offer of source code** (GPL v2 §3(b))

  This distribution is accompanied by a written offer, valid for at least three years from the release date of `v1.0` (May 17, 2026), to provide any third party — for a charge no more than the cost of physically performing source distribution — a complete machine-readable copy of the corresponding source code, under the terms of GPL v2, on a medium customarily used for software interchange.

  - For most users, the source code is available at no cost at <https://github.com/mkxp-z/mkxp-z/tree/1f412ce980dc9a25b9aa6c5d0161ca6a8714e953>. Cloning that exact commit reproduces the source of the binary distributed here.
  - Should that URL become unreachable within three years of v1.0, please open an issue on this repository requesting the source archive. The maintainer will provide it.

- **Modifications to MKXP-Z made in this distribution**: None. The `Z-universal.app` is the unmodified output of the upstream CI build at the commit listed above. The 5 KGL shader files that mkxp-z's own `src/display/gl/shader.cpp` references at runtime but that the CI workflow failed to copy into the `Assets.bundle` for the macOS build are restored verbatim from the same commit's `shader/` directory; no changes to their content. The launcher's `Contents/Game` directory is replaced with a relative symbolic link pointing to the user's game folder — this is a packaging-layer change to the `.app` bundle layout, not a modification to MKXP-Z's source.

- **Embedded sub-components inside MKXP-Z** (not separately repackaged by this project; their licenses ride with the MKXP-Z binary):
  - Ruby 3.1.0 — Ruby License and BSD-2-Clause (dual)
  - SDL2, SDL2_image, SDL2_ttf, SDL2_sound — Zlib License
  - PhysicsFS — Zlib License
  - OpenAL Soft — LGPL v2
  - FluidSynth — LGPL v2.1+
  - libvorbis, libogg, libtheora — BSD-3-Clause
  - ANGLE (Almost Native Graphics Layer Engine) — BSD-3-Clause
  - Other dependencies listed in MKXP-Z's source tree under `macos/Dependencies/Frameworks/`

---

## Power Font Family

Not redistributed by this project. The `Power Clear`, `Power Green`, `Power Red and Blue`, etc. TrueType files live exclusively in the Pokémon Void game folder (which users obtain separately) and are referenced by the `solidFonts` list in [`mkxp.json`](mkxp.json). This launcher only contains the **names** of those fonts in configuration, not the font files themselves.

---

## Pokémon Void

Not redistributed by this project. Users obtain Pokémon Void from its official Discord server. This launcher contains the game's name (in repo title, README, and the launcher window title via `mkxp.json`) for the strict purpose of identifying which game the launcher is configured for, in the same way a tool named "Firefox Profile Switcher" would reference the Firefox name. The launcher contains no Pokémon-IP assets (sprites, audio, scripts, names of fictional characters/Pokémon, etc.).

---

## This launcher's own contributions

The following files in this repository are original work licensed under **GPL v3 or later** (compatible with the GPL v2+ MKXP-Z code so the combined distribution can be redistributed):

- `README.md`, `LEEME.md`
- `Install.command`
- `mkxp.json` (derived from MKXP-Z's sample `mkxp.json` template, which is GPL v2+; modifications add `solidFonts` for the Pokémon Essentials Power font family, set `fontHeightReporting: 1`, and enable `debugMode` and `pathCache`)
- `patches/kgl-shaders/README.md`
- `NOTICE.md` (this file)
- `LICENSE`

Copyright © 2026 [@stingfisher222](https://github.com/stingfisher222), with debugging assistance from Claude AI (Anthropic).

---

## If you are a rights-holder concerned about this distribution

Please open an issue on this repository. Reasonable concerns will be addressed promptly. This project exists solely to let Mac users run a game they already own; it does not redistribute the game itself and is not affiliated with the game's developers or with Nintendo / The Pokémon Company.
