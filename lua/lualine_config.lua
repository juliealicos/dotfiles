local function displayRow()
    return "row: %l/%L"
end

local function displayColumn()
    return "col: %c"
end

require('lualine').setup {
    options = {
        theme = 'dracula',
        component_separators = {''},
        section_separators = {''},
    },
    sections = {
        lualine_c = {
            {'filename', path = 1}
        },
        lualine_y = {},         -- remove file line location percentage
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
        lualine_y = {},         -- remove file line location percentage
        lualine_z = {
            {
                displayRow
            },
            {
                displayColumn
            }
        }
    }
}
