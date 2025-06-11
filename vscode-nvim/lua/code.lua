local editor = {
	closeActive = function()
		vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
	end,

	codeAction = function()
		vim.fn.VSCodeNotify("editor.action.refactor")
	end,
	closeOther = function()
		vim.fn.VSCodeNotify("workbench.action.closeOtherEditors")
	end,

	organizeImport = function()
		vim.fn.VSCodeNotify("editor.action.organizeImports")
	end,
}
-- buffer/editor
vim.keymap.set({ "n", "v" }, "<space>c", editor.closeActive)
vim.keymap.set({ "n", "v" }, "<space>ca", editor.codeAction)
vim.keymap.set({ "n", "v" }, "<space>bc", editor.closeActive)
vim.keymap.set({ "n", "v" }, "<space>k", editor.closeOther)
vim.keymap.set({ "n", "v" }, "<space>bk", editor.closeOther)
