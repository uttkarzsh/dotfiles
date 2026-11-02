return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        -- Fenced ``` blocks: no grey (ColorColumn) background, so the terminal
        -- wallpaper shows through like the rest of the editor.
        disable_background = true,
        -- Pad the ```lang line with plain spaces instead of █ bars coloured
        -- like the (now absent) block background.
        highlight_border = false,
      },
    },
  },
  -- No indent guides in markdown: snacks.indent draws a │ every shiftwidth in
  -- leading whitespace, which litters indented ``` blocks (ASCII diagrams,
  -- architecture sketches) with vertical lines. Code files keep their guides.
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        filter = function(buf)
          return vim.g.snacks_indent ~= false -- snacks' default filter...
            and vim.b[buf].snacks_indent ~= false
            and vim.bo[buf].buftype == ""
            and vim.bo[buf].filetype ~= "markdown" -- ...plus this
        end,
      },
    },
  },
  -- The markdown extra lints with markdownlint-cli2 (MD013 line-length, blank
  -- lines around headings/lists, etc.). Turn it off: pure style noise for notes.
  -- (Its conform "fix" formatter only runs when those diagnostics exist, so it
  -- goes quiet too.) An opts function is needed: an empty list in a plain opts
  -- table would be deep-merged away and leave the linter enabled.
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = {}
    end,
  },
}
