return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",  -- Use latest stable version
  lazy = true,
  ft = { "markdown", "wiki" },  -- Added wiki filetype support
  dependencies = {
    "nvim-lua/plenary.nvim",
    "3rd/image.nvim",  -- Required for image rendering
  },
  config = function()
  require("obsidian").setup {
    workspaces = {
      {
        name = "Empire",
        path = "~/Documents/Empire", -- Using ~ for portability
      },
    },

    -- Improved completion
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- Better note creation
    new_notes_location = "notes_subdir",
    note_id_func = function(title)
      -- Generate cleaner IDs
      local suffix = os.date "%Y%m%d"
      return title:gsub(" ", "-"):lower() .. "-" .. suffix
    end,

    -- Enhanced frontmatter
    note_frontmatter_func = function(note)
      local out = {
        id = note.id,
        aliases = note.aliases or {},
        tags = note.tags or {},
        created = os.date "%Y-%m-%d",
      }

      -- Safe metadata merging
      if note.metadata then
        for k, v in pairs(note.metadata) do
          if type(v) ~= "function" then -- Prevent JSON errors
            out[k] = v
          end
        end
      end

      return out
    end,

    -- Image support configuration
    attachments = {
      img_folder = "~/Pictures/Images", -- Where to store images
      img_text_func = function(path)
        return string.format("![%s](%s)", path:match "([^/]+)$", path)
      end,
    },

    -- Safer templates
    templates = {
      subdir = "templates", -- lowercase for consistency
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      substitutions = {
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        tomorrow = function()
          return os.date("%Y-%m-%d", os.time() + 86400)
        end,
        now = function()
          return os.date "%Y-%m-%d %H:%M"
        end,
      },
    },

    -- Disable built-in UI if using alternatives
    ui = {
      enable = false,
    },

    -- Optional: Prevents the JSON error you encountered
    disable_frontmatter = false,
  }

  -- Ensure image.nvim is properly configured
  require("image").setup {
    integrations = {
      markdown = {
        enabled = true,
        download_remote_images = true,
        clear_in_insert_mode = false,
      },
    },
  }
  end,
}
