-- Basic setup for render-markdown.nvim
require('render-markdown').setup({
  -- You can add more options here if needed
})

-- Keybinding: <leader>mr to toggle markdown rendering
vim.keymap.set('n', '<leader>mr', function()
  require('render-markdown').toggle()
end, { desc = 'Toggle Markdown Render' })
