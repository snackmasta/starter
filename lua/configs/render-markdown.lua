-- Basic setup for render-markdown.nvim
require('render-markdown').setup({
  -- You can add more options here if needed
  file_types = { 'markdown', 'copilot-chat' },
})

-- Keybinding: <leader>mr to toggle markdown rendering
vim.keymap.set('n', '<leader>mr', function()
  require('render-markdown').toggle()
end, { desc = 'Toggle Markdown Render' })

-- Adjust CopilotChat display settings
require('CopilotChat').setup({
  highlight_headers = false,
  separator = '---',
  error_header = '> [!ERROR] Error',
})
