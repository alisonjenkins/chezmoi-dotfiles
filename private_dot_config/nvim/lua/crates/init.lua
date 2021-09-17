function CONFIG_CRATES()
    local hascrates, crates = pcall(require,"crates")

    if not hascrates then
        return
    end

    crates.setup({
    text = {
        loading    = "  Loading...",
        version    = "  %s",
        prerelease = "  %s",
        yanked     = "  %s yanked",
        nomatch    = "  Not found",
        update     = "  %s",
        error      = "  Error fetching crate",
    },
    popup = {
        text = {
            title   = " # %s ",
            version = " %s ",
            yanked  = " %s yanked ",
        },
    },
    cmp = {
        text = {
            prerelease = " pre-release ",
            yanked     = " yanked ",
        },
    },
    })
end
