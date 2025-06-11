local fold = {
    toggle = function()
        vim.fn.VSCodeNotify("editor.toggleFold")
    end,

    all = function()
        vim.fn.VSCodeNotify("editor.foldAll")
    end,
    openAll = function()
        vim.fn.VSCodeNotify("editor.unfoldAll")
    end,

    close = function()
        vim.fn.VSCodeNotify("editor.fold")
    end,
    open = function()
        vim.fn.VSCodeNotify("editor.unfold")
    end,
    openRecursive = function()
        vim.fn.VSCodeNotify("editor.unfoldRecursively")
    end,

    blockComment = function()
        vim.fn.VSCodeNotify("editor.foldAllBlockComments")
    end,

    allMarkerRegion = function()
        vim.fn.VSCodeNotify("editor.foldAllMarkerRegions")
    end,
    openAllMarkerRegion = function()
        vim.fn.VSCodeNotify("editor.unfoldAllMarkerRegions")
    end,
}
--folding
vim.keymap.set({ "n" }, "<leader>zr", fold.openAll)
vim.keymap.set({ "n" }, "<leader>zO", fold.openRecursive)
vim.keymap.set({ "n" }, "<leader>zo", fold.open)
vim.keymap.set({ "n" }, "<leader>zm", fold.all)
vim.keymap.set({ "n" }, "<leader>zb", fold.blockComment)
vim.keymap.set({ "n" }, "<leader>zc", fold.close)
vim.keymap.set({ "n" }, "<leader>zg", fold.allMarkerRegion)
vim.keymap.set({ "n" }, "<leader>zG", fold.openAllMarkerRegion)
vim.keymap.set({ "n" }, "<leader>za", fold.toggle)

vim.keymap.set({ "n" }, "zr", fold.openAll)
vim.keymap.set({ "n" }, "zO", fold.openRecursive)
vim.keymap.set({ "n" }, "zo", fold.open)
vim.keymap.set({ "n" }, "zm", fold.all)
vim.keymap.set({ "n" }, "zb", fold.blockComment)
vim.keymap.set({ "n" }, "zc", fold.close)
vim.keymap.set({ "n" }, "zg", fold.allMarkerRegion)
vim.keymap.set({ "n" }, "zG", fold.openAllMarkerRegion)
vim.keymap.set({ "n" }, "za", fold.toggle)
