hi ColHl                guifg=White         guibg=#6272a4
hi RowHl                guifg=White         guibg=#5b7fbb
hi NotAcitveHl          guifg=White         guibg=#44475A
hi fileTypeEncFormat    guifg=White         guibg=#44788E

lua << EOF

local function displayRow()
    return "row: %l/%L"
end

local function displayColumn()
    return "col: %c"
end

local function hasFileType() local filetype = vim.bo.filetype if filetype == "" then
    return false
  end
  return true
end

local function displayFileTypeIcon()
  local file_name, file_ext = vim.fn.expand "%:t", vim.fn.expand "%:e"
  local icon = require("nvim-web-devicons").get_icon(
    file_name,
    file_ext,
    { default = true }
  )
  local filetype = vim.bo.filetype

  if filetype == "" then
    return " No FT "
  end
  return string.format("%s %s", icon, filetype):lower()
end

require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'dracula',
        component_separators = {''},
        section_separators = {''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            -- {
            --     'branch',
            -- }
        },
        lualine_c = {
            {
                'filename',
                path = 1
            },
            {
                -- 'diagnostics',
                -- sources = "nvim_lsp",
                -- -- displays diagnostics from defined severity
                -- sections = {'error', 'warn', 'info', 'hint'},
                -- -- all colors are in format #rrggbb
                -- color_error = nil, -- changes diagnostic's error foreground color
                -- color_warn = nil, -- changes diagnostic's warn foreground color
                -- color_info = nil, -- Changes diagnostic's info foreground color
                -- color_hint = nil, -- Changes diagnostic's hint foreground color
                -- symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'}
            }
        },
        lualine_x = {
            {
                'encoding',
                color = 'fileTypeEncFormat'
            },
            {
                'fileformat',
                color = 'fileTypeEncFormat'
            },
            -- {
            --     'filetype'
            -- }
            {
                displayFileTypeIcon,
                condition = hasFileType,
                color = 'fileTypeEncFormat'
            }
        },
        lualine_y = {
        },
        lualine_z = {
            {
                displayRow,
                color = 'RowHl'
            },
            {
                displayColumn,
                color = 'ColHl'
            }
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {'filename', path = 1}
        },
        lualine_x = {
            {'encoding'},
            {'fileformat'},
            -- {'filetype'}
            {
                displayFileTypeIcon,
                condition = hasFileType,
            }
        },
        lualine_y = {},
        lualine_z = {
            {
                displayRow,
                color = 'NotAcitveHl'
            },
            {
                displayColumn,
                color = 'NotAcitveHl'
            }
        }
    },
    tabline = {},
    extensions = {'quickfix', 'nvim-tree'}
}

EOF
