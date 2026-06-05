return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Initialisation de l'interface graphique du débogueur
        dapui.setup()

        -- Ouverture et fermeture automatiques de l'interface lors des événements de débogage
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

        -- Configuration de l'adaptateur via Mason
        require("mason-nvim-dap").setup({
            ensure_installed = { "codelldb" },
            handlers = {}, -- Laisse mason-nvim-dap configurer automatiquement codelldb
        })
    end,
    keys = {
        { "<F5>", function() require("dap").continue() end, desc = "DAP: Continuer / Lancer" },
        { "<F10>", function() require("dap").step_over() end, desc = "DAP: Step Over" },
        { "<F11>", function() require("dap").step_into() end, desc = "DAP: Step Into" },
        { "<F12>", function() require("dap").step_out() end, desc = "DAP: Step Out" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle Breakpoint" },
        { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Condition: ')) end, desc = "DAP: Breakpoint Conditionnel" },
        { "<leader>du", function() require("dapui").toggle() end, desc = "DAP: Basculer l'UI" },
    }
}
