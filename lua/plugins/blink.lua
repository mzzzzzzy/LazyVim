return {
  {
    "Saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        preset = "enter",
        ["<C-o>"] = { "show" },
        ["<Tab>"] = {
          LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
          "fallback",
        },
      },
      completion = {
        menu = {
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "source_name" },
            },
            treesitter = { "lsp" },
          },
        },
      },
      sources = {
        compat = {},
        -- Add 'avante' to the list
        default = { "avante", "lsp", "path", "buffer" },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {
              -- options for blink-cmp-avante
            },
          },
        },
      },
    },
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
    },
  },
}
