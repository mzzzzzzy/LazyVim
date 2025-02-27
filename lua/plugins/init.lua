local _float_console = function()
  require("dapui").float_element("console", {
    enter = true,
    title = "console",
    position = "center",
    height = math.floor(vim.o.lines * 0.9),
    width = math.floor(vim.o.columns * 0.8),
  })
end

return {
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
    keys = {
      {
        "<leader>U",
        function()
          vim.cmd.UndotreeToggle()
        end,
        desc = "UndotreeToggle",
      },
    },
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      vim.keymap.set("i", "<C-o>", function()
        return vim.fn["codeium#Complete"]()
      end, { expr = true, silent = true })
    end,
  },
  { "mg979/vim-visual-multi" },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    lazy = true,
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>dd",
        _float_console,
        desc = "Dap UI console",
      },
    },
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        _float_console()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    config = function(_, opts)
      -- Optional, you don't have to run setup.
      require("transparent").setup({
        -- table: default groups
        groups = {
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        -- table: additional groups that should be cleared
        extra_groups = {},
        -- table: groups you don't want to clear
        exclude_groups = {},
        -- function: code to be executed after highlight groups are cleared
        -- Also the user event "TransparentClear" will be triggered
        on_clear = function() end,
      })
    end,
  },
}
