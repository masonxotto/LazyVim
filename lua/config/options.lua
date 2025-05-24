-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Check if 'pwsh' (PowerShell Core) is executable and set the shell accordingly
if vim.fn.executable("pwsh") == 1 then
  vim.o.shell = "pwsh"
elseif vim.fn.executable("powershell.exe") == 1 then
  -- Fallback to Windows PowerShell if pwsh is not found
  vim.o.shell = "powershell.exe"
end

-- Setting shell command flags for PowerShell compatibility
-- These flags are important for proper command execution and output encoding
vim.o.shellcmdflag =
  "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
vim.o.shellredir = "2>&1 | Out-File %s; exit $LastExitCode"
vim.o.shellpipe = "2>&1 | Out-File %s; exit $LastExitCode"
