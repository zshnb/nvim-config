local status, hls = pcall(require, "hlslens")
if not status then
  vim.notify("没有找到 comment")
  return
end
hls.setup({})
