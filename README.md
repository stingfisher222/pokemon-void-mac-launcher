# Pokémon Void — macOS Launcher

I packaged a Mac launcher for **Pokémon Void** (with help from Claude AI) — **so you don't have to.** Took several hours of debugging to figure out; you get the result in 2 minutes.

Game files stay as-is — only the runtime that runs them is swapped out (**MKXP-Z**, open-source, works on Intel and Apple Silicon). Three Mac-specific bugs from the current MKXP-Z build come pre-fixed.

📦 **Download:** [latest release](../../releases/latest) → `PokemonVoid-Mac-Launcher.zip` (32 MB)

---

## Requirements

- macOS 11 (Big Sur) or newer — Intel or Apple Silicon
- ~200 MB free disk space
- Pokémon Void itself, downloaded separately from the official Discord (not included here)

---

## Install (2 min)

1. Download Pokémon Void from the official Discord and unzip it. You should get a folder called **`Main-Pokemon Void`** with `Game.exe`, `Audio/`, etc.

2. Put both side by side in the same directory (Desktop, `~/Games/`, wherever):

   ```
   Main-Pokemon Void/        ← the game
   Pokemon Void.app          ← the launcher from this package
   ```

3. Copy the `mkxp.json` from this package **into** `Main-Pokemon Void/`, replacing the existing one.

4. Double-click **`Pokemon Void.app`**. Done.

> **Shortcut:** just double-click `Install.command` and it handles 2–3 for you.

---

## First-launch Gatekeeper

macOS may say *"cannot be opened because the developer cannot be verified"* (MKXP-Z isn't Apple-signed). Either:

- Right-click `Pokemon Void.app` → **Open** → **Open** again, or
- Run in Terminal:

  ```bash
  xattr -dr com.apple.quarantine ~/Desktop/Pokemon\ Void.app
  ```

---

## Saves

`~/Library/Application Support/Pokemon Essentials v21.1/`

---

## Heads up

- Not Apple-signed → expect the Gatekeeper step on first launch.
- macOS deprecated OpenGL years ago; works today via ANGLE → Metal, might break on a future macOS major update.
- If a macOS update breaks it, re-run the `xattr` command — fixes most cases.

---

## What this package fixes

If you build a Mac launcher yourself from a raw MKXP-Z CI artifact (May 2026), you'll hit these three bugs. This package pre-fixes all three:

| # | Symptom | Root cause | Fix |
|---|---------|------------|-----|
| 1 | `Failed to read file at (null)` on launch | 5 KGL shaders missing from `Assets.bundle/Contents/Resources/Shaders/` (PR #326 in mkxp-z left them out of the macOS bundle) | The 5 `.frag` files are bundled inside the launcher's `Assets.bundle`. They are also published in [`patches/kgl-shaders/`](patches/kgl-shaders/) for anyone building from source. |
| 2 | `Errno::ENOENT - Audio/BGM/Title` at title screen | PhysFS path cache doesn't index symlinks that escape the mount root | The launcher's `Contents/Game` is a single **relative** symlink pointing to `../../../Main-Pokemon Void`. One mount, no escape. |
| 3 | Letters `g`, `p`, `y` clipped (descenders missing) | Documented in MKXP-Z `bitmap.cpp:2557` — RGSS-compat default truncates line height | [`mkxp.json`](mkxp.json) sets `"fontHeightReporting": 1`, and adds `solidFonts` for the Power font family. |

---

## Build from source

If you'd rather assemble the launcher yourself instead of trusting a prebuilt one:

1. Grab the latest macOS CI artifact from <https://github.com/mkxp-z/mkxp-z/actions/workflows/autobuild.yml> (requires being logged into GitHub; click the most recent successful run that has a `macOS` job and download `mkxp-z.macos.dev-*` → it contains `Z-universal.app.zip`).

2. Unzip `Z-universal.app.zip` to get `Z-universal.app`. Copy the 5 `.frag` files from [`patches/kgl-shaders/`](patches/kgl-shaders/) into the app at:

   ```
   Z-universal.app/Contents/Resources/Assets.bundle/Contents/Resources/Shaders/
   ```

3. Replace the app's `Contents/Game` directory with a relative symlink to the game folder:

   ```bash
   rm -rf Z-universal.app/Contents/Game
   ln -s "../../../Main-Pokemon Void" Z-universal.app/Contents/Game
   ```

4. Copy [`mkxp.json`](mkxp.json) from this repo into your game's `Main-Pokemon Void/` folder, replacing the one already there.

5. Strip the quarantine attribute and launch:

   ```bash
   xattr -dr com.apple.quarantine Z-universal.app
   open Z-universal.app
   ```

---

## Credits

- **Pokémon Void** — see the official Discord
- **MKXP-Z** runtime — <https://github.com/mkxp-z/mkxp-z> (GPL v2+)
- **Mac packaging** — [@stingfisher222](https://github.com/stingfisher222), with help from Claude AI (Anthropic) for debugging the three MKXP-Z build bugs and putting the launcher together. Not affiliated with the Pokémon Void developers.

---

## License

This packaging is licensed GPL v3+ to remain compatible with bundled MKXP-Z (GPL v2+). See [`LICENSE`](LICENSE).
