return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files({
          hidden = true,
          find_command = { "fd", "--type", "f", "--hidden", "--no-ignore-vcs", "--exclude", ".git" },
        })
      end,
      desc = "Find Files",
    },
  },
}
