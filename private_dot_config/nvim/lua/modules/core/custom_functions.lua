local M = {}

function M.create_git_worktree()
        local hasgitworktree, gitworktree = pcall(require, "git-worktree")

        if not hasgitworktree then
                print("The git-worktree plugin is not installed. Please install it to use this command.")
                return
        end

        local branch = vim.fn.input("Branch name: ")

        gitworktree.create_worktree("../" .. branch, branch, "origin")
end

return M
