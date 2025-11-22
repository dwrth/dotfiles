return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      border = "rounded",
    },
    styles = {
      float = {
        backdrop = 100,
        border = "rounded",
      },
    },
    dashboard = {
      preset = {
        header = [[
 _._     _,-'""`-._
(,-.`._,'(       |\`-/|
    `-.-' \ )-`( , o o)
          `-    \`_`"'-
  ]],
      },
      sections = {
        {
          section = "header",
        },
        {
          { section = "keys", gap = 0.9 },
          { section = "startup" },
        },
      },
    },
  },
}
