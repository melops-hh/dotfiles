local ok, lsp = pcall(require, "lsp-zero");
if not ok then
    vim.notify("Could not find lsp-zero");
    return
end


-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
lsp.on_attach(function(_, bufnr)
    print("lsp on attach");
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, {
            buffer = bufnr,
            desc = desc
        })
    end
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {buffer = bufnr, desc = 'Signature Documentation'})

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, {
        desc = 'Format current buffer with LSP'
    })
end)

lsp.preset("recommended");

lsp.ensure_installed({"eslint", "bashls", "clangd", "gopls", "phpactor", "pyright", "rust_analyzer", "tsserver"});
local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            -- this is the important line
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    sources = {
        { name = "copilot" , group_index = 2 },
        { name = "cmp-buffer" , group_index = 2 },
        { name = "cmp-path" , group_index = 2 },
        { name = "cmp_luasnip" , group_index = 2 },
        { name = "cmp-nvim-lsp" , group_index = 2 },
        { name = "cmp-nvim-lua" , group_index = 2 },
        { name = "nvim_lsp", group_index = 2 },
        { name = "path", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "neorg", group_index = 2 },
    },
})

lsp.nvim_workspace();
lsp.setup();

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
