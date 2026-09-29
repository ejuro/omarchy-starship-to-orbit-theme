#!/bin/bash
# Regenerates this theme's terminal configs from colors.toml (via Omarchy's own templates) and adds
# the liquid-glass background opacity, so only the background is translucent and text stays opaque.
# Run after changing colors.toml, from a theme placed in ~/.config/omarchy/themes/starship-to-orbit;
# it applies the theme to render Omarchy's templates, so it changes your current theme.
set -e
cd "$(dirname "$0")/.."
ALPHA=${ALPHA:-0.34}
rm -f ghostty.conf alacritty.toml kitty.conf foot.ini
omarchy theme set starship-to-orbit >/dev/null 2>&1
C=~/.local/state/omarchy/current/theme
note='# liquid glass: only the background is translucent, text stays opaque'
{ cat "$C/ghostty.conf"; printf '\n%s\nbackground-opacity = %s\n' "$note" "$ALPHA"; } > ghostty.conf
{ cat "$C/alacritty.toml"; printf '\n%s\n[window]\nopacity = %s\n' "$note" "$ALPHA"; } > alacritty.toml
{ cat "$C/kitty.conf"; printf '\n%s\nbackground_opacity %s\n' "$note" "$ALPHA"; } > kitty.conf
sed "0,/^\[colors-dark\]$/s//[colors-dark]\n$note\nalpha=$ALPHA/" "$C/foot.ini" > foot.ini
omarchy theme set starship-to-orbit >/dev/null 2>&1
echo "terminal configs regenerated (background alpha $ALPHA)"
