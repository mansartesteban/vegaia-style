#!/bin/bash

pnpm sass src/sass/main.scss lib/vegaia-style.css

# Dossier source contenant les fichiers SCSS
SOURCE_DIR="src"
# Dossier de destination pour les fichiers CSS compilés
DEST_DIR="lib"

# Crée le dossier de destination s'il n'existe pas
mkdir -p "$DEST_DIR"

# Fonction pour compiler les fichiers SCSS en CSS tout en recréant la structure de répertoires
compile_scss() {
  local src_file="$1"
  local dest_file="$2"

  # Crée le dossier de destination s'il n'existe pas
  mkdir -p "$(dirname "$dest_file")"

  # Compile le fichier SCSS en CSS
  sass "$src_file" "$dest_file" --watch
}

# Trouver tous les fichiers .scss dans le dossier source et les traiter un par un
find "$SOURCE_DIR" -name "*.scss" | while read -r scss_file; do
  # Crée le chemin correspondant dans le dossier de destination
  relative_path="${scss_file#$SOURCE_DIR/}"  # Enlève la partie du chemin source

  # Supprime le préfixe "_" s'il existe dans le nom du fichier
  clean_path="${relative_path//\/_/\/}"          # Retire les "_" dans les noms de dossier
  clean_file="${clean_path#_}"                   # Retire les "_" dans les noms de fichiers
  css_file="$DEST_DIR/${clean_file%.scss}.css"    # Remplace .scss par .css

  # Appelle la fonction pour compiler le SCSS
  compile_scss "$scss_file" "$css_file"

  echo "Compiled: $scss_file -> $css_file"
done