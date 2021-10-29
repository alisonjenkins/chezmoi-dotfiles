function CONFIG_PROJECT()
        local hasproject, project = pcall(require,"project_nvim")

        if not hasproject then
                return
        end

        project.setup {
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
