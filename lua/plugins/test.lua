return {
  {
    "nvim-neotest/neotest",
    opts = {
      dependencies = {
        "nvim-lua/planery.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-go",
      },
      adapters = {
        "neotest-go",
      },
    },
  },
}
