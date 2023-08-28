local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("没有找到 nvim-tree")
  return
end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  -- custom mappings
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'tv', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'th', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'c', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'cp', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'cu', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 't.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', '<F5>', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'so', api.node.run.system, opts('Run System'))
end
nvim_tree.setup({
  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  -- project plugin 需要这样设置
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    -- 宽度
    width = 40,
    -- 也可以 'right'
    side = 'left',
    -- 隐藏根目录
    hide_root_folder = false,
    -- 不显示行数
    number = false,
    relativenumber = false,
    -- 显示图标
    signcolumn = 'yes',
  },
  actions = {
    open_file = {
      -- 首次打开大小适配
      resize_window = true,
      -- 打开文件时关闭
      quit_on_open = false,
    },
  },
  filters = {
    git_ignored = false,
    custom = {
      "^.git$",
      ".DS_Store"
    }
  },
  renderer = {
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },
  system_open = {
    cmd = 'open',     -- mac 直接设置为 open
  },
  on_attach = my_on_attach
})
