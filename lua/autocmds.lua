require "nvchad.autocmds"

-- Keymap: <leader>cc to open CopilotChat
vim.keymap.set('n', '<leader>cc', function()
  vim.cmd('CopilotChat')
end, { desc = 'Open CopilotChat' })

-- Keymap: <leader>cs to save CopilotChat session
vim.keymap.set('n', '<leader>cs', function()
  vim.ui.input({ prompt = 'Save CopilotChat session as: ' }, function(input)
    if input and #input > 0 then
      vim.cmd('CopilotChatSave ' .. vim.fn.fnameescape(input))
    end
  end)
end, { desc = 'Save CopilotChat session' })

-- Keymap: <leader>cl to load CopilotChat session
vim.keymap.set('n', '<leader>cl', function()
  vim.ui.input({ prompt = 'Load CopilotChat session: ' }, function(input)
    if input and #input > 0 then
      vim.cmd('CopilotChatLoad ' .. vim.fn.fnameescape(input))
    end
  end)
end, { desc = 'Load CopilotChat session' })

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
