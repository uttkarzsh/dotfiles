return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        -- show dotfiles (.gitignore, .env.example, ...) but still respect
        -- .gitignore so node_modules/, target/, etc. stay out.
        -- The LazyVim telescope extra already excludes .git/ via its rg command.
        -- Use <a-i> inside the picker to temporarily include ignored files.
        find_files = {
          hidden = true,
        },
      },
    },
  },
}
