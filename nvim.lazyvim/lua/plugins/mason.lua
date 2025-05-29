-- ~/.config/nvim/lua/plugins/mason.lua
return {
  "williamboman/mason.nvim",
  version = "v2.0.0", -- 👈 Add or update this line
  config = function()
    require("mason").setup()
  end,
}
