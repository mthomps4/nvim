return {
  "navarasu/onedark.nvim",
  config = function()
    require("onedark").setup({
      style = "deep",
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "italic,bold",
        strings = "none",
        variables = "none",
      },
    })
    require("onedark").load()
  end,
}
