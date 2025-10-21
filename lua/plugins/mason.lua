return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "pyright",
        "black",
        "debugpy",
        "ruff"
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      automatic_installation = true,
      ensure_installed = { "pyright" }
    }
  }
}
