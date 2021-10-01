function CONFIG_PROJECT()
        require("project_nvim").setup {
                show_hidden = true
        }

        CONFIG_TELESCOPE_PROJECT()
end

function CONFIG_TELESCOPE_PROJECT()
        local hastelescope, _ = pcall(require,"telescope")

        if not hastelescope then
                return
        end

        require('telescope').load_extension('projects')

end
