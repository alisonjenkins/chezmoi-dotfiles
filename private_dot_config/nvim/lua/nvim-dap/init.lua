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

    dap.configurations.java = {
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - business-intelligence";
            hostName = "127.0.0.1";
            port = 5024;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - chronicle";
            hostName = "127.0.0.1";
            port = 5013;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - claim";
            hostName = "127.0.0.1";
            port = 5034;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - commercial";
            hostName = "127.0.0.1";
            port = 5017;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - configuration";
            hostName = "127.0.0.1";
            port = 5010;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - consented";
            hostName = "127.0.0.1";
            port = 5019;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - consumer";
            hostName = "127.0.0.1";
            port = 5023;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - generic-check";
            hostName = "127.0.0.1";
            port = 5020;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - geographic";
            hostName = "127.0.0.1";
            port = 5022;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - graph-monitoring";
            hostName = "127.0.0.1";
            port = 5031;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - hospital";
            hostName = "127.0.0.1";
            port = 5007;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - monitoring";
            hostName = "127.0.0.1";
            port = 5031;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - pdfprint";
            hostName = "127.0.0.1";
            port = 5021;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - police";
            hostName = "127.0.0.1";
            port = 5032;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - processing-monitor";
            hostName = "127.0.0.1";
            port = 5033;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - risk-assessments";
            hostName = "127.0.0.1";
            port = 5027;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - portal";
            hostName = "127.0.0.1";
            port = 5009;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - sherlock";
            hostName = "127.0.0.1";
            port = 5015;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - signalbox";
            hostName = "127.0.0.1";
            port = 5005;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - stockpile";
            hostName = "127.0.0.1";
            port = 5012;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - tagging";
            hostName = "127.0.0.1";
            port = 5026;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - tapestry";
            hostName = "127.0.0.1";
            port = 5014;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - vehicle";
            hostName = "127.0.0.1";
            port = 5011;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - weaver";
            hostName = "127.0.0.1";
            port = 5030;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - websearch";
            hostName = "127.0.0.1";
            port = 5018;
        },
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote - workbench";
            hostName = "127.0.0.1";
            port = 5028;
        },
    }

    vim.g.dap_virtual_text = "all frames"
end
