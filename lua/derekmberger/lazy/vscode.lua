-- lua/derekmberger/lazy/vscode.lua
return {
  "Mofiqul/vscode.nvim",
  -- load early so your other plugins pick up the same theme
  lazy = false,
  opts = {
    -- choose "dark" or "light"
    theme = "dark",          -- VSCode Dark+ colors
    -- other options you can tweak:
    -- transparent = false,  -- keep the background
    -- italic_comments = true,
    -- disable_nvimtree_bg = true,
  },
  config = function(_, opts)
    require("vscode").setup(opts)
    vim.cmd.colorscheme("vscode")
  end,
}
