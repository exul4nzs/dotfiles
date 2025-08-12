return {
  'b0o/incline.nvim',
  config = function()
    local helpers = require('incline.helpers')
    local incline = require('incline')

    incline.setup({
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      render = function(props)
        -- Check if toggle variable is off
        if vim.g.incline_hidden then
          return {} -- show nothing
        end

        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        local ft_icon, ft_color = require('nvim-web-devicons').get_icon_color(filename)
        local modified = vim.bo[props.buf].modified

        local buffer = {
          ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
          " ",
          { filename, gui = modified and "bold,italic" or "bold" },
          " ",
          guibg = "#363944",
        }
        return buffer
      end
    })

    -- Leader key toggle
    vim.g.incline_hidden = false
    vim.keymap.set("n", "<leader>Ti", function()
      vim.g.incline_hidden = not vim.g.incline_hidden
      incline.refresh() -- force redraw
    end, { desc = "Toggle Incline" })
  end,
  event = 'VeryLazy',
}
<<<<<<< HEAD

=======
>>>>>>> 27faf42fcc5bc51571f09cc7aea64aa55b18a3e1
