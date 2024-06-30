-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

lvim.leader = ","
-- custom tabs 
lvim.keys.normal_mode["gt"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["gT"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-l>"] = ":BufferLineCycleNext<CR>"
-- open file in a new tab 
lvim.keys.normal_mode["<leader>t"] = "<Esc>:tabe"
lvim.keys.normal_mode["<leader>tc"] = ":tabclose<cr>"
-- pop off stack https://github.com/LunarVim/LunarVim/discussions/2706
lvim.keys.normal_mode["<C-t>"] = ":pop<cr>"
--nmap <S-t> :tabnew<CR>
--map <leader>tn :tabnew<cr>
lvim.keys.normal_mode["<S-t>"] = ":tabnew<cr>"
lvim.keys.normal_mode["<leader>tn"] = ":tabnew<cr>"
lvim.keys.visual_mode["o"] = "gc"

lvim.plugins = {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "gelguy/wilder.nvim",
    config = function()
      local wilder = require("wilder")
      wilder.setup({modes = {":", "/", "?"}})
      wilder.set_option("pipeline", {
          wilder.branch(wilder.python_file_finder_pipeline({
              file_command = function(_, arg)
                  if string.find(arg, ".") ~= nil then
                      return {"fd", "-tf", "-H"}
                  else
                      return {"fd", "-tf"}
                  end
              end,
              dir_command = {"fd", "-td"},
              filters = {"fuzzy_filter", "difflib_sorter"}
          }), wilder.cmdline_pipeline(), wilder.python_search_pipeline())
      })

      wilder.set_option("renderer", wilder.popupmenu_renderer({
          highlighter = wilder.basic_highlighter(),
          left = {" "},
          right = {" ", wilder.popupmenu_scrollbar({thumb_char = " "})},
          highlights = {default = "WilderMenu", accent = "WilderAccent"}
      }))
    end,
  },
}

local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)


