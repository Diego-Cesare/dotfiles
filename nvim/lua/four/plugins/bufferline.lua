local colors = {
  blue = "#9BB8CD",
  green = "#C3E2C2",
  violet = "#AC87C5",
  yellow = "#FFB996",
  red = "#FF90BC",
  fg = "#c3ccdc",
  bg = "#1c1c1c",
  inactive_bg = "#141414",
}

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      --separator_style = "slant",
      indicator_icon = " ",
      buffer_close_icon = "󰖭",
      -- buffer_close_icon = '',
      modified_icon = "",
      close_icon = "󰖭",
      -- close_icon = '',
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 30,
      max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
      tab_size = 16,
      diagnostics = false, -- | "nvim_lsp" | "coc",
      diagnostics_update_in_insert = false,
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = true,
      always_show_bufferline = true,
    },
    highlights = {
      fill = {
        bg = "",
       },
       separator_selected = {
        fg = colors.fg,
       },
       tab_close = {
        fg = colors.red
       },
       tab_selected = {
        bg = colors.blue,
        fg = colors.bg,
        bold = false,
       },
    }
  },
}
