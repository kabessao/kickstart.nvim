-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- quit diagnostics list

if nixCats 'custom' == false then
  return {}
end

vim.cmd [[
augroup diagnostics
  autocmd!
  autocmd FileType qf nmap <buffer> q <cmd>q<cr>
augroup end
]]

vim.cmd [[
augroup zk_css
  autocmd!
  autocmd BufRead,BufNewFile *css.dsp set filetype=css
augroup end
]]

require('lspconfig').nil_ls.setup {}

vim.wo.relativenumber = true

vim.opt.scrolloff = 5

vim.opt.foldmethod = 'marker'

vim.opt.tabstop = 2

vim.opt.shiftwidth = 2

vim.opt.cursorline = true

vim.opt.colorcolumn = '120'

vim.opt.list = false

vim.notify = require 'notify'
vim.print = require 'notify'

-- LazyGit commands
vim.keymap.set('n', '<leader>gg', '<CMD>LazyGit<CR>', { silent = true, desc = 'Open Lazygit' })
vim.keymap.set('n', '<leader>gc', '<CMD>LazyGitCurrentFile<CR>', { silent = true, desc = 'Open Lazygit with curent file' })

-- vim.keymap.set('n', '<', '<<_', { noremap = true, silent = true })
-- vim.keymap.set('n', '>', '>>_', { noremap = true, silent = true })

vim.keymap.set('v', '<', '<<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>>gv', { noremap = true, silent = true })

vim.keymap.set('n', '<c-k>', '<c-w>k', { silent = true })
vim.keymap.set('n', '<c-j>', '<c-w>j', { silent = true })
vim.keymap.set('n', '<c-l>', '<c-w>l', { silent = true })
vim.keymap.set('n', '<c-h>', '<c-w>h', { silent = true })

vim.keymap.set('n', '<leader>z', ':UndotreeToggle<CR>', { silent = true })

vim.keymap.set('n', '<leader>tc', ':CloakToggle<CR>', { silent = true, desc = '[t]oggle [c]loak' })

vim.keymap.set('n', '<C-j>', 'j', { silent = true })
vim.keymap.set('n', '<C-k>', 'k', { silent = true })
vim.keymap.set('n', '<C-h>', 'h', { silent = true })
vim.keymap.set('n', '<C-l>', 'l', { silent = true })

vim.keymap.set('n', '<M-j>', ':m .+1<CR>==', { silent = true })
vim.keymap.set('x', '<M-j>', ":m '>+1<CR>gv-gv", { silent = true })

vim.keymap.set('n', '<M-k>', ':m .-2<CR>==', { silent = true })
vim.keymap.set('x', '<M-k>', ":m '<-2<CR>gv-gv", { silent = true })

vim.keymap.set('n', '<m-l>', '<cmd>BufferNext<CR>', { silent = true })
vim.keymap.set('n', '<m-h>', '<cmd>BufferPrevious<CR>', { silent = true })
vim.keymap.set('n', '<m-c-l>', '<cmd>BufferMoveNext<CR>', { silent = true })
vim.keymap.set('n', '<m-c-h>', '<cmd>BufferMovePrevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>c', '<cmd>BufferClose<CR>', { silent = true })

vim.keymap.set({ 'n', 'v' }, '<leader>rR', ':s;\\<"\\>;', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>rr', ':s;";', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>ra', ':s;$;', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>ri', ':s;^;', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>rf', ':s;";', { silent = true })

vim.keymap.set({ 'n', 'v' }, '<leader>a:', ':Tab /:<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>a,', ':Tab /,<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>a=', ':Tab /=<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>a|', ':Tab /|<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>a ', ':Tab / <cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>a;', ':Tab /;<cr>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.g.firenvim_config = {
  globalSettings = {
    alt = 'all',
    takeover = 'never',
  },
  localSettings = {
    ['.*'] = {
      cmdline = 'neovim',
      content = 'text',
      priority = 0,
      selector = 'textarea',
      takeover = 'never',
    },
  },
}

if vim.g.started_by_firenvim == true then
  vim.o.showtabline = 0
end

return {

  -- my plugins
  'rcarriga/nvim-notify',
  'RRethy/vim-illuminate',
  'mbbill/undotree',
  'mfussenegger/nvim-lint',
  'nvim-tree/nvim-web-devicons',

  {
    'jmbuhr/otter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  },

  {
    'norcalli/nvim-colorizer.lua',
    opts = {},
  },

  'mfussenegger/nvim-jdtls',

  {
    'tadmccorkle/markdown.nvim',
    ft = 'markdown', -- or 'event = "VeryLazy"'
    opts = {
      -- configuration here or empty for defaults
    },
  },

  {
    'NMAC427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end,
  },

  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup {
        lightbulb = {
          enable = false,
        },
      }
      vim.keymap.set('n', 'gp', '<CMD>Lspsaga peek_definition<CR>', { silent = true, desc = 'Peek Definition' })
      vim.keymap.set('n', 'K', '<CMD>Lspsaga hover_doc<CR>', { silent = true })
    end,
  },

  {
    'laytan/cloak.nvim',
    config = function()
      require('cloak').setup {
        enabled = true,
        patterns = {
          {
            file_pattern = '*.yaml',
            cloak_pattern = { ':.+', '-.+' },
          },
        },
      }
    end,
  },

  {
    'kelly-lin/ranger.nvim',
    config = function()
      local ranger = require 'ranger-nvim'
      local ui = {
        border = 'rounded',
        height = 0.9,
        width = 0.9,
      }

      ranger.setup {
        replace_netrw = true,
        ui = ui,
      }

      local openInCurrentFile = function()
        ranger.open(true)
      end

      local openAtWorkspaceRoot = function()
        ranger.open(false)
      end

      vim.keymap.set('n', '<leader>or', openInCurrentFile, { silent = true, desc = '[o]pen [r]anger' })
      vim.keymap.set('n', '<leader>ow', openAtWorkspaceRoot, { silent = true, desc = '[o]pen ranger at [w]orkspace root' })
    end,
  },

  {
    'sindrets/diffview.nvim',
    config = function()
      require('diffview').setup {
        view = {
          merge_tool = {
            layout = 'diff3_mixed',
            disable_diagnostics = true,
            winbar_info = true,
          },
        },
      }
    end,
  },

  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      if not vim.g.started_by_firenvim then
        vim.g.barbar_auto_setup = false
      end
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    -- version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  'godlygeek/tabular',
  'kdheepak/lazygit.nvim',
  'tpope/vim-obsession',

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },
  {
    'glacambre/firenvim',

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = ':call firenvim#install(0)',
  },
}
