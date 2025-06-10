return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua       = { "stylua" },
                go        = { "gofmt" },
                terraform = { "terraform_fmt" },
                hcl       = { "packer_fmt" },
            },
        })
    end
}
