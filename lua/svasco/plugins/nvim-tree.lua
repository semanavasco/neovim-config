return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    local nvimtree = require("nvim-tree")

    -- recommended settings from the nvim-tree docs
    vim.g.loaded_netrw      = 1
    vim.g.loaded_netrPlugin = 1

    nvimtree.setup({
      -- changes the size of the file explorer
      view = {
        width          = 35,
        relativenumber = true,
      },
      -- changes the icons for folders
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disabling window_pickers when window splitting to prevent bugs
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      -- show files ignored by git
      git = {
        ignore = false,
      },
    })

    -- setting custom keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggles the file explorer." })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggles file explorer at file's location." })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapses the file explorer." })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refreshes the file explorer." })
  end
}
