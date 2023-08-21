local status, comment = pcall(require, "comment")
if not status then
  vim.notify("没有找到 comment")
  return
end
comment.setup({
  ---Add a space b/w comment and the line
  padding = true,
  ---Whether the cursor should stay at its position
  sticky = true,
  ---Lines to be ignored while (un)comment
  ignore = nil,
  ---LHS of toggle mappings in NORMAL mode
  toggler = {
    ---Line-comment toggle keymap
    line = '<C-/>',
    ---Block-comment toggle keymap
    block = 'cbc',
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = '<C-/>',
    ---Block-comment keymap
    block = 'cb',
  },
  ---LHS of extra mappings
  extra = {
    ---Add comment on the line above
    above = 'ccO',
    ---Add comment on the line below
    below = 'cco',
    ---Add comment at the end of line
    eol = 'ccA',
  },
  ---Enable keybindings
  ---NOTE: If given `false` then the plugin won't create any mappings
  mappings = {
    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    basic = true,
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = true,
  },
  ---Function to call before (un)comment
  pre_hook = nil,
  ---Function to call after (un)comment
  post_hook = nil,
})
