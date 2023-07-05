vim.cmd("setlocal tabstop=4 shiftwidth=4")

if vim.fn.has("mac") == 1 then
  local config = {
    cmd = { "/opt/homebrew/opt/jdtls/bin/jdtls" },
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  }

  require("jdtls").start_or_attach(config)
end
