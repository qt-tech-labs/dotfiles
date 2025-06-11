-- Debug
local debug = {
	-- Next change
	start = function()
		vim.fn.VSCodeNotify("workbench.action.debug.start")
	end,
	-- toggle debug point
	toggleBreakpoint = function()
		vim.fn.VSCodeNotify("editor.debug.action.toggleBreakpoint")
	end,
	-- Terminate session
	terminateSession = function()
		vim.fn.VSCodeNotify("workbench.action.debug.stop")
	end,
	-- Disable points
	disablePoint = function()
		vim.fn.VSCodeNotify("workbench.debug.viewlet.action.toggleBreakpointsActivatedAction")
	end,

	-- Continue
	continue = function()
		vim.fn.VSCodeNotify("workbench.action.debug.continue")
	end,

	-- Step over
	stepOver = function()
		vim.fn.VSCodeNotify("workbench.action.debug.stepOver")
	end,
}
vim.keymap.set({ "n" }, "<leader>ds", debug.start)
vim.keymap.set({ "n" }, "<leader>dt", debug.terminateSession)
vim.keymap.set({ "n" }, "<leader>db", debug.toggleBreakpoint)
vim.keymap.set({ "n" }, "<leader>dc", debug.continue)
vim.keymap.set({ "n" }, "<leader>dd", debug.disablePoint)
vim.keymap.set({ "n" }, "<leader>dn", debug.stepOver)
