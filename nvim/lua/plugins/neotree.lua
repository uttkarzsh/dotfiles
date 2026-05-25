return {
  "nvim-neo-tree/neo-tree.nvim",

  opts = {
    window = {
      width = 20,
    },

    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },

    default_component_configs = {
      container = {
        enable_character_fade = false,
      },

      indent = {
        with_markers = false,
        indent_size = 1,
        padding = 0,
      },

      icon = {
        folder_closed = "▸",
        folder_open = "▾",
        folder_empty = "▸",
        default = " ",
      },

      modified = {
        symbol = "",
      },

      git_status = {
        symbols = {
          added = "",
          modified = "",
          deleted = "",
          renamed = "",
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      },

      diagnostics = {
        symbols = {
          hint = "",
          info = "",
          warn = "",
          error = "",
        },
      },
    },
  },
}
