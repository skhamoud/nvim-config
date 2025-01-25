return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- eslint = {
        --   enabled = true,
        -- },
        -- tsserver = {
        --   enabled = false,
        -- },
        -- ts_ls = {
        --   enabled = false,
        -- },
        -- vtsls = {
        --   enabled = false,
        -- },
      },
      setup = {
        tsserver = {
          settings = {
            seperate_diagnostic_server = true,
            -- "change"|"insert_leave" determine when the client asks the server about diagnostic
            publish_diagnostic_on = "insert_leave",
          },
        },
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
