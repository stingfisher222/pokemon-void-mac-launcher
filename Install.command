#!/bin/bash
# Doble-click este archivo en Finder para instalar Pokemon Void en Mac.
# Doble-click this file in Finder to install Pokemon Void launcher.

set -e
cd "$(dirname "$0")"
HERE="$(pwd)"

clear
echo "========================================================================"
echo " Pokemon Void - Mac Launcher Installer"
echo "========================================================================"
echo

# Detectar carpeta del juego
GAME_DIR=""
for candidate in "$HERE/Main-Pokemon Void" "$HERE/../Main-Pokemon Void" "$HOME/Desktop/Main-Pokemon Void" "$HOME/Downloads/Main-Pokemon Void"; do
  if [ -d "$candidate" ] && [ -f "$candidate/Game.ini" ]; then
    GAME_DIR="$candidate"
    break
  fi
done

if [ -z "$GAME_DIR" ]; then
  echo "ERROR: No encuentro la carpeta del juego 'Main-Pokemon Void'."
  echo "       Asegurate de tenerla descargada y al lado de este instalador,"
  echo "       o en Desktop / Downloads."
  echo
  echo "ERROR: Can't find the game folder 'Main-Pokemon Void'."
  echo "       Make sure you downloaded it and placed it next to this"
  echo "       installer, or in Desktop / Downloads."
  echo
  read -n 1 -p "Presiona cualquier tecla para cerrar / Press any key..." _
  exit 1
fi

echo "[1/4] Carpeta del juego detectada:"
echo "      $GAME_DIR"
echo

echo "[2/4] Copiando mkxp.json patcheado al juego..."
if [ -f "$GAME_DIR/mkxp.json" ] && [ ! -f "$GAME_DIR/mkxp.json.original" ]; then
  cp "$GAME_DIR/mkxp.json" "$GAME_DIR/mkxp.json.original"
  echo "      (backup del original guardado como mkxp.json.original)"
fi
cp "$HERE/mkxp.json" "$GAME_DIR/mkxp.json"
echo "      OK"
echo

echo "[3/4] Posicionando el launcher..."
APP_TARGET="$(dirname "$GAME_DIR")/Pokemon Void.app"
if [ -e "$APP_TARGET" ] && [ "$APP_TARGET" != "$HERE/Pokemon Void.app" ]; then
  rm -rf "$APP_TARGET"
fi
if [ "$APP_TARGET" != "$HERE/Pokemon Void.app" ]; then
  cp -R "$HERE/Pokemon Void.app" "$APP_TARGET"
fi
echo "      Launcher en: $APP_TARGET"
echo

echo "[4/4] Quitando bandera de Gatekeeper..."
xattr -dr com.apple.quarantine "$APP_TARGET" 2>/dev/null || true
echo "      OK"
echo

echo "========================================================================"
echo " LISTO! Doble-click en 'Pokemon Void.app' para jugar."
echo " DONE! Double-click 'Pokemon Void.app' to play."
echo "========================================================================"
echo
read -n 1 -p "Presiona cualquier tecla para cerrar / Press any key to close..." _
