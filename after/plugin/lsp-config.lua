local mason = require("mason")
local mlsp = require("mason-lspconfig")

local lsp = require "lspconfig"
local coq = require "coq"

mason.setup()
mlsp.setup()
mlsp.setup_handlers {
    function(servername)
        lsp[servername].setup(coq.lsp_ensure_capabilities())
    end
}

vim.cmd[[COQnow --shut-up]]
