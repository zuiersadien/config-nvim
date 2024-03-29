return {
  { "shmup/vim-sql-syntax" },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          disable = { "jsx", "cpp" },
          -- Which query to use for finding delimiters
          query = "rainbow-parens",
          -- Highlight the entire buffer all at once
          -- strategy = require('ts-rainbow').strategy.global,
        },
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",

    config = function()
      require("ufo").setup({
        provider_selector = function()
          return { "lsp", "indent" }
        end,
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-angular" },
  { "nacro90/numb.nvim" },
  { "aquach/vim-http-client" },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "mariadb", "sql", "mysql", "plsql", "psql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },

  { "akinsho/toggleterm.nvim", version = "*", config = true },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },
  {
    "petertriho/nvim-scrollbar",
  },
  {
    "shortcuts/no-neck-pain.nvim",
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require("colorful-winsep").setup()
    end,
    event = { "WinNew" },
  },
  {
    "jyscao/ventana.nvim",
    keys = {
      { "<leader>wt", "<cmd>ventanatranspose<cr>", desc = "ventana transpose" },
      { "<leader>wf", "<cmd>VentanaShift<cr>", desc = "VentanaShift" },
      { "<leader>wg", "<cmd>VentanaShiftMaintainLinear<cr>", desc = "VentanaShift and Line" },
      -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    },
  },
  {
    "dhruvasagar/vim-zoom",
    -- keys = {
    --
    --   { "<leader>wz", "call zoom#toggle()", desc = "ventana zoom" },
    -- },
  },

  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    build = ":ToggleTerm",
    keys = { { "<A-3>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" } },
    opts = {
      open_mapping = "<A-3>",
      direction = "vertical",
      shade_filetypes = {},
      size = 80,
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
    },
  },
  -- {
  --   "nyngwang/NeoZoom.lua",
  --   config = function()
  --     require("neo-zoom").setup()
  --   end,
  --   keys = {
  --
  --     { "<leader>wz", "<cmd>NeoZoomToggle<cr>", desc = "ventana zoom" },
  --   },
  -- },
}
