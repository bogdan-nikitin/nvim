return {
  name = "ITMO C++ Adv Course build project",
  builder = function()
    -- Full path to current file (see :help expand())
    -- local file = vim.fn.getcwd()
    return {
      cmd = { "./ci-extra/build.sh" },
      args = { "SanitizedDebug" },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cpp", "h" },
  },
}
