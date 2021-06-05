function CONFIG_NVIM_COMMENT()
        local hasnvimcomment, nvim_comment = pcall(require, "nvim_comment")

        if not hasnvimcomment then
                return
        end

        nvim_comment.setup()
end
