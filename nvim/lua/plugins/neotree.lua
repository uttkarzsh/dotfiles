return {
  "nvim-neo-tree/neo-tree.nvim",

  opts = {
    window = {
      width = 20,
    },

    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_ignored = true,
        children_inherit_highlights = true,
      },
    },

    default_component_configs = {
      container = {
        enable_character_fade = false,
      },

      name = {
        use_filtered_colors = true,
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
