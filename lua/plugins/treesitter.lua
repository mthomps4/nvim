-- add more treesitter parsers
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      indent = { enable = false },
      highlight = { enable = true },
    })
  end,
}
