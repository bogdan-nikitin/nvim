return {
  name = "CMake Ninja",
  builder = function()
    -- Full path to current file (see :help expand())
    -- local file = vim.fn.getcwd()
    return {
      cmd = { "cmake" },
      args = { "-B", "build", "-G", "Ninja" },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cpp", "h" },
  },
}
