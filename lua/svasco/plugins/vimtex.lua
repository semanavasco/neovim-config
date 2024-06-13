return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_general_viewer = "okular"
  end,
  config = function()
    -- setting keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>texC", ":VimtexCompile<CR>", { desc = "Compiles LaTeX file into PDF." })

    keymap.set("n", "<leader>texS", function()
      vim.fn.jobstart("okular " .. vim.fn.expand("%:r") .. ".pdf", { detach = true })
    end, { noremap = true, silent = true, desc = "Open generated LaTeX file in Okular." })

    keymap.set("n", "<leader>texI", function()
      local home = vim.fn.expand("~")
      local path = home .. "/AppData/Local/nvim/LaTeX/"
      local required_files = { "letterfonts.tex", "macros.tex", "preamble.tex" }
      local template = path .. "template.tex"

      -- for each required file -> paste it in the current working directory
      for _, file in ipairs(required_files) do
        local source = path .. file
        local destination = vim.fn.expand("%:p:h") .. "/" .. file

        local src = io.open(source, "rb")
        if not src then
          return
        end

        local dst = io.open(destination, "wb")
        if not dst then
          return
        end

        local chunk_size = 2 ^ 13 -- 8K
        while true do
          local chunk = src:read(chunk_size)

          if not chunk then
            break
          end

          if not dst:write(chunk) then
            break
          end
        end

        src:close()
        dst:close()
      end

      -- gets the current buffer and pastes the template's content into it
      local current_buf = vim.api.nvim_get_current_buf()
      local template_content = vim.fn.readfile(template)

      vim.api.nvim_buf_set_lines(current_buf, -1, -1, false, template_content)
    end, { desc = "Imports all of the required LaTeX files." })
  end,
}
