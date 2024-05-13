-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  transparency = false,
  -- transparency = true,

  hl_override = {
  	Comment = { italic = true },
  	["@comment"] = { italic = true },
  },

  nvdash = {
    load_on_startup = true,
    header = {
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    },
  },

  statusline = {
    theme = "minimal",
    separator_style = "round",
    order = { "mode", "file", "git", "%=", "clip", "lsp_msg", "%=", "diagnostics", "lsp", "cursor" },
    modules = {
      clip = function()
        local clipboard_contents = vim.fn.getreg('+')
        local text = string.gsub(clipboard_contents, "\n", "")
        local max_length = 40
        if #text > max_length then
          text = string.sub(text, 1, max_length) .. "..."
        end
        return "%#Comment#" .. text
      end,
    }
  },

  tabufline = {
    order = { "treeOffset", "buffers", "tabs" },
  },
}

return M
