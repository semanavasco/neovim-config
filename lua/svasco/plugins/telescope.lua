return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.6',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    -- setting keymaps
    local builtin = require("telescope.builtin")
    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy finds files in the current working directory." })
    keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy finds recent files." })
    keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Finds strings in the current working directory." })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Finds TO-DOs."})
  end,
}
