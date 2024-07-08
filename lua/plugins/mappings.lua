return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { name = "Buffers" },
          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

          ["<Leader>t1v"] = { ":1ToggleTerm direction=horizontal name='[1]'<CR>", desc = "Toggle Terminal 1 vertical" },
          ["<Leader>t2v"] = { ":2ToggleTerm direction=horizontal name='[2]'<CR>", desc = "Toggle Terminal 2 vertical" },
          ["<Leader>t3v"] = { ":3ToggleTerm direction=horizontal name='[3]'<CR>", desc = "Toggle Terminal 3 vertical" },
          ["<Leader>t4v"] = { ":4ToggleTerm direction=horizontal name='[4]'<CR>", desc = "Toggle Terminal 4 vertical" },
          ["<Leader>t5v"] = { ":5ToggleTerm direction=horizontal name='[5]'<CR>", desc = "Toggle Terminal 5 vertical" },

          ["<Leader>lm"] = { name = "Markdown" },
          ["<Leader>lmt"] = { ":RenderMarkdownToggle<CR>", desc = "Toggle Markdown Rendering" },
          ["<Leader>lmp"] = { ":MarkdownPreviewToggle<CR>", desc = "Start Markdown Preview" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
          ["<a-t>"] = { "<C-\\><C-n>", desc = "To terminal normal mode" },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
