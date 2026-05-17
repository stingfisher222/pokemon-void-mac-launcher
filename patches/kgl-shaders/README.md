# KGL Shader Patches

These 5 GLSL fragment shaders are missing from the May 2026 MKXP-Z CI builds for macOS, even though they are referenced by `src/display/gl/shader.cpp` at runtime. Without them, MKXP-Z aborts on startup with the misleading error:

```
Failed to read file at (null)
```

This is because `filesystemImplApple.mm:103` calls `path.UTF8String` on a `nil` NSString when the asset isn't found.

## Origin

These files are copied verbatim from the `mkxp-z/mkxp-z` repository, branch `dev`, commit `1f412ce` (May 7, 2026):

- <https://github.com/mkxp-z/mkxp-z/blob/dev/shader/kglInvert.frag>
- <https://github.com/mkxp-z/mkxp-z/blob/dev/shader/kglCompressAlpha.frag>
- <https://github.com/mkxp-z/mkxp-z/blob/dev/shader/kglSubtract.frag>
- <https://github.com/mkxp-z/mkxp-z/blob/dev/shader/kglShadowH.frag>
- <https://github.com/mkxp-z/mkxp-z/blob/dev/shader/kglShadowV.frag>

## How to apply

Copy these `.frag` files into:

```
Z-universal.app/Contents/Resources/Assets.bundle/Contents/Resources/Shaders/
```

(MKXP-Z reads them via `mkxp_fs::contentsOfAssetAsString("Shaders/<name>", "frag")`.)

## License

GPL v2 or later, same as MKXP-Z.
