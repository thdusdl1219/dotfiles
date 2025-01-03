-- Configure neovim python host.
-- This can be executed lazily after entering vim, to save startup time.
vim.schedule(function() require 'config.pynvim' end)

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
