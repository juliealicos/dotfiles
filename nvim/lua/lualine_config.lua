local function displayRow()
    return "row: %l/%L"
end

local function displayColumn()
    return "col: %c"
end

local function displayFileLines()
    return " %L"
end

require('lualine').setup({
  options = {
    theme = 'dracula',
    component_separators = {'|'},
    section_separators = {'|'},
  },
  sections = {
    lualine_c = {
      {'filename', path = 1}
    },
    lualine_x = {
      {'encoding'},
      {'fileformat'},
      {'filetype'},
    },
    -- lualine_y = { displayFileLines },
    lualine_y = {},
    lualine_z = {
      {
        displayRow
      },
      {
        displayColumn
      }
    }
  },
  inactive_sections = {
    lualine_c = {
      {'filename', path = 1}
    },
    lualine_x = {
      {'encoding'},
      {'fileformat'},
      {'filetype'},
    },
    -- lualine_y = { displayFileLines },
    -- lualine_z = {
    --   {
    --       displayRow
    --   },
    --   {
    --       displayColumn
    --   }
    -- }
  },
  extensions = {
    'nvim-tree',
    'quickfix'
  }
})
