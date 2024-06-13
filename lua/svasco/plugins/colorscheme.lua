return {
  "folke/tokyonight.nvim",
  priority = 1000,         -- loads before everything else
  config = function()      -- is executed when the plugin loads
    vim.cmd("colorscheme tokyonight")
  end
}
