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
    },
    opts = {
      workspaces = {
        {
        name = "personal",
        path = "~/Downloads/school-notes/notes/spring-2024/",
        },
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
    --     auto_update = true,
    --     neovim_image_text = "The One True Text Editor",
    --     main_image = "file",
    --     client_id = "793271441293967371",
    --     log_level = nil,
    --     debounce_timeout = 10,
    --     enable_line_number = true,
    --     blacklist = {},
    --     buttons = true,
    --     file_assets = {},
    --     show_time = true,
    --
    --     -- Rich Presence text options
    --     editing_text = "Editing %s",
    --     file_explorer_text = "Browsing %s",
    --     git_commit_text = "Committing changes",
    --     plugin_manager_text = "Managing plugins",
    --     reading_text = "Reading %s",
    --     workspace_text = "Working on %s",
    --     line_number_text = "Line %s out of %s",
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
