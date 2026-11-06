#!/usr/bin/env bash
# Symlink these dotfiles into ~/.config, plus ~/.zshrc.
# Safe to re-run: existing correct links are left alone, anything else in the
# way is moved aside to <name>.backup.<timestamp> rather than deleted.
#
#   ./install.sh            link everything
#   ./install.sh --dry-run  show what would happen, change nothing

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
CONFIGS=(nvim kitty aerospace fastfetch)
DRY_RUN=0

usage() {
  sed -n '2,8p' "$0" | sed 's/^# \{0,1\}//'
}

for arg in "$@"; do
  case "$arg" in
    -n | --dry-run) DRY_RUN=1 ;;
    -h | --help) usage; exit 0 ;;
    *) echo "unknown option: $arg" >&2; usage >&2; exit 1 ;;
  esac
done

run() {
  if ((DRY_RUN)); then
    printf '    [dry-run] %s\n' "$*"
  else
    "$@"
  fi
}

suffix=".backup.$(date +%Y%m%d-%H%M%S)"

link() {
  local name="$1" src="$2" dest="$3"

  if [[ ! -e "$src" ]]; then
    echo "  ! $name: not in repo, skipping"
    return
  fi

  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    echo "  ✓ $name: already linked"
    return
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    echo "  ↪ $name: backing up existing $dest -> $dest$suffix"
    run mv "$dest" "$dest$suffix"
  fi

  echo "  → $name: linking $dest -> $src"
  run ln -s "$src" "$dest"
}

echo "Linking configs from $DOTFILES into $CONFIG_HOME"
[[ -d "$CONFIG_HOME" ]] || run mkdir -p "$CONFIG_HOME"

for name in "${CONFIGS[@]}"; do
  link "$name" "$DOTFILES/$name" "$CONFIG_HOME/$name"
done

# ~/.zshrc lives in $HOME, not ~/.config. Linked before the prompt check below,
# which then finds the prompt already in the repo's copy.
link zshrc "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

# zsh prompt: "user in ~/path" on one line, orange ❯ on the next.
# Appended to ~/.zshrc once; skipped if the marker or the same prompt is already there.
ZSHRC="$HOME/.zshrc"
PROMPT_MARKER="# >>> dotfiles prompt >>>"
echo
if [[ -f "$ZSHRC" ]] && grep -qF -e "$PROMPT_MARKER" -e "PROMPT='%F{172}%n%f %F{245}in" "$ZSHRC"; then
  echo "  ✓ zsh prompt: already in $ZSHRC"
else
  echo "  → zsh prompt: appending to $ZSHRC"
  if ((DRY_RUN)); then
    echo "    [dry-run] append prompt block to $ZSHRC"
  else
    cat >>"$ZSHRC" <<'EOF'

# >>> dotfiles prompt >>>
autoload -Uz colors && colors

PROMPT='%F{172}%n%f %F{245}in %F{252}%~%f
%F{172}❯ %f'
# <<< dotfiles prompt <<<
EOF
  fi
fi

# AeroSpace refuses to start if both config locations exist.
if [[ -e "$HOME/.aerospace.toml" ]]; then
  echo
  echo "  ! ~/.aerospace.toml exists and conflicts with $CONFIG_HOME/aerospace/aerospace.toml;"
  echo "    remove or rename it so AeroSpace uses the linked config."
fi

# Report (don't install) anything the configs expect.
missing=()
for cmd in git nvim rg fd fastfetch magick; do
  command -v "$cmd" >/dev/null 2>&1 || missing+=("$cmd")
done
for app in kitty AeroSpace; do
  [[ -d "/Applications/$app.app" ]] || missing+=("$app.app")
done
if ! compgen -G "$HOME/Library/Fonts/JetBrainsMono*NerdFont*" >/dev/null &&
  ! compgen -G "/Library/Fonts/JetBrainsMono*NerdFont*" >/dev/null; then
  missing+=("JetBrainsMono Nerd Font")
fi

echo
if ((${#missing[@]})); then
  echo "Not found (install these yourself, e.g. with Homebrew):"
  printf '  - %s\n' "${missing[@]}"
else
  echo "All expected tools found."
fi

((DRY_RUN)) && echo && echo "Dry run: nothing was changed."
exit 0
