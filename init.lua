vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy");
if not status_ok then
  return
end

require "global.remap"
require "global.opt"

lazy.setup(
  {
    spec = {
      { import = "plugins" },
      { import = "lsp" },
      { import = "appearance" }
    },
    change_detection = {
      notify = false,
    },
  },
  {
    change_detection = {
      notify = false,
    },
  }
)
