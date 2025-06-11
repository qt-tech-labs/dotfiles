local file = {
    findFile = function()
        vim.fn.VSCodeNotify("workbench.action.quickOpen")
    end,

    new = function()
        vim.fn.VSCodeNotify("workbench.explorer.fileView.focus")
        vim.fn.VSCodeNotify("explorer.newFile")
    end,

    save = function()
        vim.fn.VSCodeNotify("workbench.action.files.save")
    end,

    saveAll = function()
        vim.fn.VSCodeNotify("workbench.action.files.saveAll")
    end,

    -- if grep extension is used
    grep = function()
        vim.fn.VSCodeNotify("quickgrep.action")
    end,
    format = function()
        vim.fn.VSCodeNotify("editor.action.formatDocument")
    end,

    showInExplorer = function()
        vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
    end,

    rename = function()
        vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
        vim.fn.VSCodeNotify("renameFile")
    end,
}
-- file
vim.keymap.set({ "n" }, "<leader>ff", file.findFile)
vim.keymap.set({ "n", "v" }, "<space>w", file.save)
vim.keymap.set({ "n", "v" }, "<leader>fg", file.grep)
vim.keymap.set({ "n", "v" }, "<space>wa", file.saveAll)
vim.keymap.set({ "n", "v" }, "<space>fs", file.save)
vim.keymap.set({ "n", "v" }, "<space>fS", file.saveAll)
vim.keymap.set({ "n" }, "<space>fn", file.new)
vim.keymap.set({ "n" }, "<space>ft", file.showInExplorer)
vim.keymap.set({ "n" }, "<space>fr", file.rename)
