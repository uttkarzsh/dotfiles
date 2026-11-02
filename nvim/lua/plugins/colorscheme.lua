return {
  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italics = {
        comments = true,
        keywords = true,
        functions = true,
        strings = true,
        variables = true,
      },
      overrides = {
        -- Inline `code` in markdown: vesper's peach on a transparent bg.
        -- Defaults were grey text (Special #65737e) on a grey ColorColumn bg.
        -- (Fenced ``` blocks are made transparent in plugins/markdown.lua.)
        RenderMarkdownCodeInline = { fg = "#FFC799", bg = "NONE" },
        ["@markup.raw.markdown_inline"] = { fg = "#FFC799" },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vesper",
    },
  },
}
