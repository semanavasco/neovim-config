return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },                 -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javascript template strings nodes
        java = false,                       -- don't check treesitter in java
      },
    })

    -- importing nvim-autopairs completion functionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    -- importing the completions plugin
    local cmp = require("cmp")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
}
