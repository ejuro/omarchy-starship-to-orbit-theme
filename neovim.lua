-- Starship To Orbit for Neovim (aether.nvim), generated from colors.toml plus plume syntax.
return {
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      -- Starship To Orbit: code in the colours of the Raptor plume. Only the syntax changes; the
      -- palette (and so git and diagnostics: green added, red removed) stays as in colors.toml.
      on_highlights = function(hl, c)
        local flame, hot, amber, ember, ice = "#ff9f0a", "#fff3dc", "#ffc27a", "#ff6a3d", "#dfe9f2"
        local set = function(groups, spec) for _, g in ipairs(groups) do hl[g] = spec end end
        set({ "Keyword", "Statement", "Conditional", "Repeat", "Exception", "Include",
              "@keyword", "@keyword.function", "@keyword.return", "@keyword.operator",
              "@keyword.conditional", "@keyword.repeat", "@keyword.import", "@keyword.exception" }, { fg = flame })
        set({ "Function", "@function", "@function.call", "@function.method", "@function.method.call",
              "@function.builtin", "@constructor" }, { fg = hot, bold = true })
        set({ "String", "Character", "@string", "@character" }, { fg = amber })
        set({ "@string.escape", "@string.special", "SpecialChar" }, { fg = flame })
        set({ "Number", "Float", "Boolean", "@number", "@number.float", "@boolean" }, { fg = ember })
        set({ "Constant", "@constant", "@constant.builtin" }, { fg = "#ffb35c" })
        set({ "Type", "@type", "@type.builtin", "@module", "@namespace" }, { fg = ice, bold = true })
        set({ "Identifier", "@property", "@variable.member", "@field" }, { fg = "#e6e9ee" })
        set({ "@variable.parameter", "@parameter" }, { fg = "#fbe6cc" })
        set({ "PreProc", "Special", "@attribute", "@macro", "@function.macro" }, { fg = "#ffd8a8" })
        set({ "Comment", "@comment" }, { fg = "#7c7c82", italic = true })
        set({ "@punctuation.bracket", "@punctuation.delimiter" }, { fg = "#98989d" })
      end,
      colors = {
        bg = "#1c1c1e",
        dark_bg = "#161618",
        darker_bg = "#0e0e10",
        lighter_bg = "#2c2c2e",

        fg = "#f5f5f7",
        dark_fg = "#98989d",
        light_fg = "#fbfbfd",
        bright_fg = "#ffffff",
        muted = "#636366",

        red = "#ff5f4a",
        yellow = "#f2eee8",
        orange = "#ff9f0a",
        green = "#a8e6c1",
        cyan = "#dfe9f2",
        blue = "#c3ccd6",
        magenta = "#ffffff",
        brown = "#b8a99a",

        bright_red = "#ff8373",
        bright_yellow = "#ffffff",
        bright_green = "#c4efd5",
        bright_cyan = "#f0f5fa",
        bright_blue = "#dde3ea",
        bright_magenta = "#ffffff",

        accent = "#ff9f0a",
        cursor = "#ffffff",
        foreground = "#f5f5f7",
        background = "#1c1c1e",
        selection = "#3a3a3c",
        selection_foreground = "#ffffff",
        selection_background = "#3a3a3c",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
