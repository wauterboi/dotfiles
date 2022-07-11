local packer = require 'packer'

return packer.startup(function()
  use 'OmniSharp/omnisharp-vim'
  use {
  'neoclide/coc.nvim',
    branch = 'master',
    run = 'yarn install --frozen lockfile'
  }
  use 'dense-analysis/ale'
  use 'teal-language/vim-teal'
  use 'sbdchd/neoformat'
  use 'marrub--/vim-zscript'
end)
