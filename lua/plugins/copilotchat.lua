return {
  "CopilotC-Nvim/CopilotChat.nvim",
  lazy = false, -- Load it immediately, or set event = "InsertEnter" if you want lazy loading
  dependencies = {
    { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {},
  cmd = { "CopilotChat", "CopilotChatToggle" },
  config = function(_, opts)
    require("CopilotChat").setup(opts or {})
  end,
}
