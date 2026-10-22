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
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vesper",
    },
  },
}
