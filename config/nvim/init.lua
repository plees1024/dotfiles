-- Github API token, why it is here? I guess it was the first open editor I could find...: ghp_Y0wD9Efwn5Xkxe5hpvT32wJWiJ5tFj32Tau

-- Treat .clad files as XML
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.clad",
    command = "set filetype=xml"
})

-- Packer initialisation
dofile(vim.fn.stdpath("config") .. "/Packer.lua")

-- Plugins!
dofile(vim.fn.stdpath("config") .. "/Plugins.lua")

-- General settings
dofile(vim.fn.stdpath("config") .. "/Settings.lua")

-- Keymaps
dofile(vim.fn.stdpath("config") .. "/Keymaps.lua")

-- Plugin configurations
dofile(vim.fn.stdpath("config") .. "/Plugin-configs.lua")

-- EZTags
-- dofile(vim.fn.stdpath("config") .. "/EZTags.lua")
