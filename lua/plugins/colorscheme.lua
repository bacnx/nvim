return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      on_highlights = function(hl, c)
        hl.TelescopeNormal = {
          bg = "none",
          fg = c.fg_light,
        }
        hl.TelescopeBorder = {
          bg = "none",
          fg = "#3d59a1",
        }
      end,
    },
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
