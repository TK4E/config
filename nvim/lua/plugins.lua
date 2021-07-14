vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    use {'~/.config/nvim/my-plug/eleline'}

    use {'~/.config/nvim/my-plug/init'}

    use {'~/.config/nvim/my-plug/Chips'}

    use {'~/.config/nvim/my-plug/ass', ft = {'ass', 'str'}}

    use {'lifepillar/vim-gruvbox8', config = 'require [[Plug/gruvbox8]]'}

    use {'nacro90/numb.nvim', config = 'require [[Plug/numb]]'}

    use {
        'akinsho/nvim-bufferline.lua',
        config = 'require [[Plug/nvim-bufferline]]'
    }

    use {
        'preservim/tagbar',
        opt = true,
        ft = {'c', 'cpp', 'rust', 'lua', 'shell', 'py', 'go'}
    }

    use {'Krasjet/auto.pairs', config = 'require [[Plug/auto-pairs]]'} -- 括号补全

    use {'godlygeek/tabular'} -- data-binary

    --     use {
    --         'rust-lang/rust.vim',
    --         opt = true,
    --         ft = {'rust'},
    --         config = 'require [[Plug/rust]]'
    --     }

    use {'RRethy/vim-illuminate', config = 'require [[Plug/vim-illuminate]]'}

    use {
        'mg979/vim-visual-multi',
        --       branch = 'master',
        config = 'require [[Plug/vim-visual-multi]]'
    } -- 块编辑

    use {'voldikss/vim-translator'} -- 翻译文本

    use {'christoomey/vim-sort-motion'} -- 文本排序

    use {'machakann/vim-sandwich'} -- 替换括号

    use {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        config = 'require [[Plug/undotree]]'
    } -- undo history

    use {
        'neoclide/coc.nvim',
        opt = true,
        run = 'proxychains4 -q yarn install --frozen-lockfile',
        ft = {'c', 'cpp', 'rust', 'lua', 'shell', 'py', 'go'}
    }

    use {'soywod/himalaya', rtp = 'vim'} -- Send email

    use {'junegunn/vim-easy-align'}

    use {'phaazon/hop.nvim', as = 'hop', config = 'require [[Plug/hop]]'}

    use {
        'mzlogin/vim-markdown-toc',
        ft = {'markdown'},
        config = 'require [[Plug/vim-markdown-toc]]'

    }
    --     use {
    --         'lervag/wiki.vim',
    --         ft = 'markdown',
    --         run = ':WikiEnable',
    --         config = 'require [[Plug/vimwiki]]'
    --     }

    -- use {
    --     'lervag/vimtex',
    --     ft = {'tex'}
    -- }

    use {'aquach/vim-mediawiki-editor', ft = {'wiki'}}

end)

