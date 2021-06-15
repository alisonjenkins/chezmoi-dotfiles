function CONFIG_NVIM_DAP()
    local hasdap, dap = pcall(require, "dap")

    if not hasdap then
        return
    end

    dap.adapters.lldb = {
        name = "lldb",
        type = 'executable',
        command = '/usr/bin/lldb-vscode',
    }

    dap.configurations.rust = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},

            -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
            --
            --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            --
            -- Otherwise you might get the following error:
            --
            --    Error on launch: Failed to attach to the target process
            --
            -- But you should be aware of the implications:
            -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
            runInTerminal = false,
        },
    }

    vim.g.dap_virtual_text = "all frames"
end
