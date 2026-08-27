vim.g.rustaceanvim = {
    server = {
        default_settings = {
            ['rust-analyzer'] = {
                inlayHints = {
                    typeHints = { enable = false },
                    chainingHints = { enable = false },
                    closureReturnTypeHints = { enable = 'never' },
                    expressionAdjustmentHints = { enable = 'never' },
                    lifetimeElisionHints = { enable = 'never' },
                    bindingModeHints = { enable = false },
                    closingBraceHints = { enable = false },
                    parameterHints = { enable = false },
                },
            },
        },
    },
}
