# Pokémon Void — Launcher para macOS

Armé un launcher para Mac de **Pokémon Void** (con ayuda de Claude AI) — **para que tú no tengas que hacerlo.** Me llevó varias horas de debugging; tú lo tienes funcionando en 2 minutos.

Los archivos del juego no se modifican — solo cambia el motor que los ejecuta (**MKXP-Z**, open-source, funciona en Mac Intel y Apple Silicon). Tres bugs específicos del build de Mac vienen pre-arreglados.

📦 **Descarga:** [última release](../../releases/latest) → `PokemonVoid-Mac-Launcher.zip` (32 MB)

---

## Requisitos

- macOS 11 (Big Sur) o más nuevo — Intel o Apple Silicon
- ~200 MB libres
- El juego Pokémon Void descargado del Discord oficial (no incluido)

---

## Instalación (2 min)

1. Descarga Pokémon Void del Discord oficial y descomprímelo. Debes obtener una carpeta llamada **`Main-Pokemon Void`** con `Game.exe`, `Audio/`, etc.

2. Pon estos DOS items en la MISMA carpeta (Desktop, `~/Games/`, donde quieras):

   ```
   Main-Pokemon Void/        ← el juego
   Pokemon Void.app          ← el launcher de este paquete
   ```

3. Copia el `mkxp.json` de este paquete **adentro** de `Main-Pokemon Void/`, reemplazando el que ya está ahí.

4. Doble-click en **`Pokemon Void.app`**. Listo.

> **Atajo:** doble-click en `Install.command` y hace los pasos 2–3 por ti.

---

## Si Gatekeeper te bloquea la primera vez

macOS puede decir *"no se puede abrir porque no se puede verificar el desarrollador"* (MKXP-Z no está firmado por Apple). Soluciones:

- Botón derecho sobre `Pokemon Void.app` → **Abrir** → **Abrir** otra vez, o
- En Terminal:

  ```bash
  xattr -dr com.apple.quarantine ~/Desktop/Pokemon\ Void.app
  ```

---

## Saves

`~/Library/Application Support/Pokemon Essentials v21.1/`

---

## Detalles a tener en cuenta

- No está firmado por Apple → la primera vez vas a ver el aviso de Gatekeeper.
- macOS deprecó OpenGL hace años. Sigue funcionando vía ANGLE → Metal, pero alguna actualización futura podría romperlo.
- Si una actualización de macOS lo rompe, corre el comando `xattr` de arriba — arregla el 95% de los casos.

---

## Créditos

- **Pokémon Void** — ver Discord oficial
- **MKXP-Z** — <https://github.com/mkxp-z/mkxp-z> (GPL v2+)
- **Packaging para Mac** — Miguel ([@stingfisher222](https://github.com/stingfisher222)), con ayuda de Claude AI (Anthropic) para debuggear los tres bugs de MKXP-Z y armar el launcher. Sin relación con los devs de Pokémon Void.
