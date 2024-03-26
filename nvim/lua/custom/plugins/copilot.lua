return {
  {
    'github/copilot.vim',
    config = function()
      --vim.g['copilot_assume_mapped '] = true
      --vim.g['copilot_no_tab_map'] = true
      --vim.g['copilot_tab_fallback '] = ''

      --vim.keymap.set('i', '<C-l>', 'copilot#Accept("<CR>")', {
      --  expr = true,
      --  replace_keycodes = false,
      --})
      --vim.keymap.set('i', '<C-k>', '<Plug>(copilot-next)')
      --vim.keymap.set('i', '<C-g>', '<Plug>(copilot-accept-word)')
    end,
  },
}
