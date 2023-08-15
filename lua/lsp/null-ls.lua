local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("没有找到 null-ls")
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    -- frontend
    formatting.prettier.with({ -- 只比默认配置少了 markdown
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
      },
      prefer_local = "node_modules/.bin",
    }),
    -- formatting.fixjson,
    -- formatting.black.with({ extra_args = { "--fast" } }),
  },
  -- 保存自动格式化
  on_attach = function(client)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
  end,
})
