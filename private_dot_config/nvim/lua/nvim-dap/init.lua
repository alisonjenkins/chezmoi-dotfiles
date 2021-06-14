function CONFIG_NVIM_DAP()
    local hasdap, dap = pcall(require, "dap")

    if not hasdap then
        return
    end

    dap.adapters.rust = {
        type = 'executable',
        attach = {
            pidProperty = "pid",
            pidSelect = "ask"
        },
        command = 'lldb',
        env = {
            LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
        },
        name = "lldb"
    }
end
