return {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup()
    end,
    event = 'BufRead', -- Carregar somente em buffers lidos
    setup = function()
        lazy.opt('lazy', true) -- Carregamento preguiçoso
    end
}