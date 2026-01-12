return {
  name = "CMake Build",
  builder = function()
    -- Full path to current file (see :help expand())
    -- local file = vim.fn.getcwd()
    return {
      cmd = { "cmake" },
      args = { "--build", "build" },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cpp", "h" },
  },
}
