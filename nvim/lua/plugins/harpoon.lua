return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>H", mark.add_file, { desc = "Harpoon: Mark File" })
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle Harpoon Menu" })

    vim.keymap.set("n", "<leader>H1", function()
      ui.nav_file(1)
    end, { desc = "Harpoon File 1" })

    vim.keymap.set("n", "<leader>H2", function()
      ui.nav_file(2)
    end, { desc = "Harpoon File 2" })

    vim.keymap.set("n", "<leader>H3", function()
      ui.nav_file(3)
    end, { desc = "Harpoon File 3" })

    vim.keymap.set("n", "<leader>H4", function()
      ui.nav_file(4)
    end, { desc = "Harpoon File 4" })

    vim.keymap.set("n", "<leader>H5", function()
      ui.nav_file(4)
    end, { desc = "Harpoon File 5" })
  end,
}
