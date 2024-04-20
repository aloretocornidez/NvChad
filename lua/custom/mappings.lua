---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.nabla = {
  n = {
    -- I don't know why this isn't working for now.
    -- ["<leader>le"] = {
    --   config = function()
    --     require("nabla").enable_virt({ autogen = true })
    --   end,
    --   "Enable Latex",
    -- },
    -- ["<leader>lt"] = {
    --   config = function()
    --     require("nabla").toggle_virt({ autogen = true })
    --   end,
    --   "Toggle Latex",
    -- },
    -- ["<leader>lp"] = {
    --   config = function()
    --     require("nabla").popup()
    --   end,
    --   "Popup Equation",
    -- },
    ["<leader>lt"] = {":lua require(\"nabla\").toggle_virt({autogen = true}) <CR>", "Toggle Latex"},
    ["<leader>lr"] = {":lua require(\"nabla\").enable_virt({autogen = true}) <CR>", "Enable Latex"},
    ["<leader>lp"] = {":lua require(\"nabla\").popup() <CR>", "Popup Latex"},
  },
}

M.obsidian = {

  n = {

    -- close buffer + hide terminal buffer
    ["<leader>oc"] = { "<cmd> ObsidianCheck <CR>", "ObsidianCheck" },
    ["<leader>ob"] = { "<cmd> Backlinks <CR>", "Backlinks" },
    ["<leader>of"] = { "<cmd> ObsidianFollowLink <CR>", "ObsidianFollowLink" },
    ["<leader>ol"] = { "<cmd> ObsidianLink <CR>", "ObsidianLink" },
    ["<leader>oln"] = { "<cmd> ObsidianLinkNew <CR>", "ObsidianLinkNew" },
    ["<leader>on"] = { "<cmd> ObsidianNew <CR>", "ObsidianNew" },
    ["<leader>oo"] = { "<cmd> ObsidianOpen <CR>", "ObsidianOpen" },
    ["<leader>opi"] = { "<cmd> ObsidianPasteImg <CR>", "ObsidianPasteImg" },
    ["<leader>oqs"] = { "<cmd> ObsidianQuickSwitch <CR>", "ObsidianQuickSwitch" },
    ["<leader>orn"] = { "<cmd> ObsidianRename <CR>", "ObsidianRename" },
    ["<leader>os"] = { "<cmd> ObsidianSearch <CR>", "ObsidianSearch" },
    ["<leader>ota"] = { "<cmd> ObsidianTags <CR>", "ObsidianTags" },
    ["<leader>ote"] = { "<cmd> ObsidianTemplate <CR>", "ObsidianTemplate" },
    ["<leader>otod"] = { "<cmd> ObsidianToday <CR>", "ObsidianToday" },
    ["<leader>otom"] = { "<cmd> ObsidianTomorrow <CR>", "ObsidianTomorrow" },
    ["<leader>ow"] = { "<cmd> ObsidianWorkspace <CR>", "ObsidianWorkspace" },
    ["<leader>oy"] = { "<cmd> ObsidianYesterday <CR>", "ObsidianYesterday" },
  },
}
-- more keybinds!

return M
