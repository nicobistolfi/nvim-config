return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { 
    import = "nvchad.blink.lazyspec",
    sources = {
      per_filetype = {
        codecompanion =  { "codecompanion" },
      }
    }
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "go"
  		},
  	},
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
      -- tell treesitter to use the markdown parser for mdx files
      vim.treesitter.language.register('markdown', 'mdx')
    end,
  },
  -- Astro Plugin  
  {
    "wuelnerdotexe/vim-astro",
    opts = {}
  },

  {
    "frankroeder/parrot.nvim",
    lazy = false,
    dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
    module = "parrot.completion.blink",
    name = "parrot",
    score_offset = 20,
    opts = {
      show_hidden_files = false,
      max_items = 50,
      providers = {
      anthropic = {
        api_key = os.getenv("ANTHROPIC_API_KEY"),
        endpoint = "https://api.anthropic.com/v1/messages",
        topic_prompt = "You only respond with 3 to 4 words to summarize the past conversation.",
        topic = {
          model = "claude-3-haiku-20240307",
          params = { max_tokens = 32 },
        },
        -- default parameters for the actual model
        params = {
          chat = { max_tokens = 4096 },
          command = { max_tokens = 4096 },
        },
        -- optionally provide a selection of your favorite models
        models = {
          "claude-3-haiku-20240307",
          "claude-3-opus-20240229",
          "claude-3-sonnet-20240229",
        }
      },
      }
    },
  },

  -- Configure CodeCompanion AI for automcomplete with NVIM
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    opts = {

      strategies = {
        cmd = {
          adapter = "anthropic",
        },
        chat = {
          adapter = "anthropic",
        },
        inline = {
          adapter = "anthropic",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  }, 

}
