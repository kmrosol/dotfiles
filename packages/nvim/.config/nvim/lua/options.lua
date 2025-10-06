-- ============================================================================
-- Neovim Options Configuration
-- ============================================================================

-- Shell Configuration
local shell_opts = {
  shell = '/bin/zsh',
}

-- Indentation and Formatting
local indent_opts = {
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
  autoindent = true,
  textwidth = 0,
}

-- UI and Display
local ui_opts = {
  conceallevel = 0,
  number = true,
  mouse = '',
}

-- Search Configuration
local search_opts = {
  ignorecase = true,
  smartcase = true,
  hlsearch = true,
}

-- Apply all options
local function apply_options(opts_table)
  for k, v in pairs(opts_table) do
    vim.opt[k] = v
  end
end

apply_options(shell_opts)
apply_options(indent_opts)
apply_options(ui_opts)
apply_options(search_opts)

-- Global variables
vim.g.vim_json_syntax_conceal = 0
