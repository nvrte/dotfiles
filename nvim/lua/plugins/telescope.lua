return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ahmedkhalf/project.nvim", -- Optional for auto root
  },
  config = function()
    require("telescope").setup({
      defaults = {
        -- Default behavior here
      },
      extensions = {
        project = {
          base_dirs = { "~/code", "~/projects" }, -- Optional
          hidden_files = true,
        },
      },
    })
    require("telescope").load_extension("projects")
    require("project_nvim").setup()
  end,
}
