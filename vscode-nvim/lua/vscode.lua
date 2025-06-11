local vscode = {
    focusEditor = function()
        vim.fn.VSCodeNotify("workbench.action.focusActiveEditorGroup")
    end,
    moveSideBarRight = function()
        vim.fn.VSCodeNotify("workbench.action.moveSideBarRight")
    end,
    moveSideBarLeft = function()
        vim.fn.VSCodeNotify("workbench.action.moveSideBarLeft")
    end,
}

-- vscode
vim.keymap.set({ "n" }, "<leader>ve", vscode.focusEditor)
vim.keymap.set({ "n" }, "<leader>vl", vscode.moveSideBarLeft)
vim.keymap.set({ "n" }, "<leader>vr", vscode.moveSideBarRight)
