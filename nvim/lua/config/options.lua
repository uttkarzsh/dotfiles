-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Start in ~/developer only when nvim is launched bare from $HOME.
-- `nvim some/file` or `nvim` inside a project dir keep their own cwd.
if vim.fn.argc() == 0 and vim.uv.cwd() == vim.uv.os_homedir() then
  vim.cmd.cd("~/developer")
end
