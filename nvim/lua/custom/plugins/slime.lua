return {
  'jpalardy/vim-slime',
  init = function()
    -- these two should be set before the plugin loads
    vim.g.slime_target = 'zellij'
    vim.g.slime_no_mappings = true
    vim.g.slime_bracketed_paste = 1
  end,
  config = function()
    vim.g.slime_default_config = { session_id = 'current', relative_pane = 'right' }
    --vim.g.slime_default_config.relative_pane = 'right'
    -- options not set here are g:slime_neovim_menu_order, g:slime_neovim_menu_delimiter, and g:slime_get_jobid
    -- see the documentation above to learn about those options

    -- called MotionSend but works with textobjects as well
    vim.keymap.set('n', 'gz', '<Plug>SlimeMotionSend', { remap = true, silent = false })
    vim.keymap.set('n', 'gzz', '<Plug>SlimeLineSend', { remap = true, silent = false })
    vim.keymap.set('x', 'gz', '<Plug>SlimeRegionSend', { remap = true, silent = false })
    vim.keymap.set('n', 'gzc', '<Plug>SlimeConfig', { remap = true, silent = false })

    vim.keymap.set('n', '<leader>x', '<Plug>SlimeSendCell', { remap = true, silent = false })
    vim.g.slime_cell_delimiter = '# %%'
  end,
}
