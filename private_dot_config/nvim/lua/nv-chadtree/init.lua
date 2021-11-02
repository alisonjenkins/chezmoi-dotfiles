function CONFIG_CHADTREE()
        local haschadtree, chadtree = pcall(require,"chadtree")

        if not haschadtree then
                return
        end

        chadtree.setup()
end
