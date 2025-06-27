require "nvchad.autocmds"

-- Enable Copilot suggestion keymaps in copilot-chat buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'copilot-chat',
  callback = function()
    -- Map Tab to accept Copilot suggestion
    vim.api.nvim_buf_set_keymap(0, 'i', '<Tab>', "copilot#Accept('<Tab>')", { expr = true, silent = true, noremap = true })
    -- Map <Right> to accept Copilot suggestion
    vim.api.nvim_buf_set_keymap(0, 'i', '<Right>', "copilot#Accept('<Right>')", { expr = true, silent = true, noremap = true })
    -- Map <Down> to next Copilot suggestion
    vim.api.nvim_buf_set_keymap(0, 'i', '<Down>', "copilot#Next()", { expr = true, silent = true, noremap = true })
    -- Map <Up> to previous Copilot suggestion
    vim.api.nvim_buf_set_keymap(0, 'i', '<Up>', "copilot#Previous()", { expr = true, silent = true, noremap = true })
  end,
})
