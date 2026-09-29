-- Starship To Orbit: liquid glass. Windows are lightly frosted panes of the launch behind them,
-- edged by a 1 px Raptor plume (white-hot, engine flame, red-orange), with large squircle corners
-- and the faintest warm glow.
-- Terminals get their transparency from their own background opacity (ghostty.conf,
-- alacritty.toml, kitty.conf, foot.ini in this theme), so their text stays fully opaque.
-- Hyprland 0.55+ Lua (Omarchy Quattro).
--
-- Only honoured for themes placed by hand in ~/.config/omarchy/themes/
-- (themes installed with `omarchy theme install` have their .lua stripped).

local active_border_color = { colors = { "rgba(fff3dcee)", "rgba(ff9f0add)", "rgba(ff4f1fcc)" }, angle = 90 }
local inactive_border_color = { colors = { "rgba(ffffff40)", "rgba(ffffff12)" }, angle = 135 }

hl.config({
  general = {
    gaps_in = 7,
    gaps_out = 14,
    border_size = 1,
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    rounding = 22,
    rounding_power = 4,          -- squircle corners, like macOS
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    -- a faint warm glow on the focused window; a small neutral shadow on the others
    shadow = {
      enabled = true,
      range = 6,
      render_power = 4,
      offset = "0 1",
      color = "rgba(ff8a2a18)",   -- the faintest warm glow from the plume, hugging the edge
      color_inactive = "rgba(00000026)",
    },
    -- the glass: a light frosting, so the launch stays recognisable behind each window and only
    -- fine detail is softened
    blur = {
      enabled = true,
      size = 4,
      passes = 2,
      new_optimizations = true,
      xray = false,
      contrast = 1.0,
      brightness = 0.85,
      noise = 0.01,
      vibrancy = 0.35,
      vibrancy_darkness = 0.35,
      popups = true,
      special = true,
    },
  },
})

-- Apps without their own background opacity become glass panes as a whole; terminals are left to
-- their own (text-preserving) background opacity.
hl.window_rule({
  match = { class = "^(omawrite|com.thisisgm.flea)$" },
  tag = "-default-opacity",
  opacity = "0.52 override 0.46 override",
})

-- The Omarchy shell's own surfaces (bar, launcher and menus, notifications, OSD, polkit, pickers)
-- get the same light frosting. ignore_alpha keeps the blur to the panels themselves: the faint
-- full-screen dimming behind menus (scrim, 20%) stays unblurred, so the desktop stays sharp.
hl.layer_rule({
  match = { namespace = "^(omarchy-bar|omarchy-menu|omarchy-notifications|omarchy-osd|omarchy-polkit|omarchy-reminders|omarchy-clipboard|omarchy-emojis|omarchy-image-selector|omarchy-keyboard-panel|omarchy-network-qr)$" },
  blur = true,
  ignore_alpha = 0.3,
})
