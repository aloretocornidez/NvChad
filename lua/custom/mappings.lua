---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- ["<leader>p"] =  {":lua require("nabla").popup()<CR>", "Customize with popup({border = ...})  : `single` (default), `double`, `rounded`},
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
