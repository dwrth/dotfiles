local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

if vim.g.vscode then
  -- Remap folding keys
  vim.api.nvim_set_keymap("n", "zM", '<Cmd>call VSCodeNotify("editor.foldAll")<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap(
    "n",
    "zR",
    '<Cmd>call VSCodeNotify("editor.unfoldAll")<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap("n", "zc", '<Cmd>call VSCodeNotify("editor.fold")<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap(
    "n",
    "zC",
    '<Cmd>call VSCodeNotify("editor.foldRecursively")<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap("n", "zo", '<Cmd>call VSCodeNotify("editor.unfold")<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap(
    "n",
    "zO",
    '<Cmd>call VSCodeNotify("editor.unfoldRecursively")<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "za",
    '<Cmd>call VSCodeNotify("editor.toggleFold")<CR>',
    { noremap = true, silent = true }
  )
else
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })

  require("blink-cmp").setup({
    completion = {
      menu = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
      },
      documentation = {
        window = {
          border = "rounded",
        },
      },
    },
  })
end
