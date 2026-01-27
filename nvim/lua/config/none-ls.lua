local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.clang_format.with({
            extra_args = function()
                return { "-style=file", "-assume-filename=~/.clang-format" }
            end,
        }),
--        null_ls.builtins.formatting.verible_verilog_format.with({
--            extra_args = {
--                "--port_declarations_right_align_packed_dimensions=true",
--                "--port_declarations_right_align_unpacked_dimensions=true",
--                "--port_declarations_alignment=align",
--                "--port_declarations_indentation=indent",
--                "--named_port_alignment=align",
--                "--named_port_indentation=indent",
--                "--named_parameter_alignment=align",
--                "--named_parameter_indentation=indent",
--                "--indentation_spaces=4",
--                "--wrap_end_else_clauses=true",
--            },
--        }),
    },

    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
