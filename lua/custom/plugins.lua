local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
    ensure_installed = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        -- {
        -- name = "personal",
        -- path = "~/vaults/personal",
        -- },
        -- {
        -- name = "work",
        -- path = "~/vaults/work",
        -- },
      },
    },
  },

  {
    "jbyuki/nabla.nvim",
    lazy = true,
    ft = { "markdown" },
    ensure_installed = { "latex" },
    config = function()
      require("nabla").enable_virt { autogen = true, silent = true }
    end,
  },

  {
    -- "andweeb/presence.nvim",
    -- lazy = false,
    -- config = function()
    --   require("presence").setup {
    --     -- General options
    --     auto_update = true,                             -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    --     neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    --     main_image = "file",                            -- Main image display (either "neovim" or "file")
    --     client_id = "793271441293967371",               -- Use your own Discord application client id (not recommended)
    --     log_level = nil,                                -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    --     debounce_timeout = 10,                          -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    --     enable_line_number = true,                     -- Displays the current line number instead of the current project
    --     blacklist = {},                                 -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    --     buttons = true,                                 -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    --     file_assets = {},                               -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    --     show_time = true,                               -- Show the timer
    --
    --     -- Rich Presence text options
    --     editing_text = "Editing %s",              -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    --     file_explorer_text = "Browsing %s",       -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    --     git_commit_text = "Committing changes",   -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    --     plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    --     reading_text = "Reading %s",              -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    --     workspace_text = "Working on %s",         -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    --     line_number_text = "Line %s out of %s",   -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
    --   }
    -- end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
