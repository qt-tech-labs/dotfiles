vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

local whichkey = {
	show = function()
		vim.fn.VSCodeNotify("whichkey.show")
	end,
}

local workbench = {
	showCommands = function()
		vim.fn.VSCodeNotify("workbench.action.showCommands")
	end,
	previousEditor = function()
		vim.fn.VSCodeNotify("workbench.action.previousEditor")
	end,
	nextEditor = function()
		vim.fn.VSCodeNotify("workbench.action.nextEditor")
	end,
}

local symbol = {
	rename = function()
		vim.fn.VSCodeNotify("editor.action.rename")
	end,
}

-- if bookmark extension is used
local bookmark = {
	toggle = function()
		vim.fn.VSCodeNotify("bookmarks.toggle")
	end,
	list = function()
		vim.fn.VSCodeNotify("bookmarks.list")
	end,
	previous = function()
		vim.fn.VSCodeNotify("bookmarks.jumpToPrevious")
	end,
	next = function()
		vim.fn.VSCodeNotify("bookmarks.jumpToNext")
	end,
}

local search = {
	reference = function()
		vim.fn.VSCodeNotify("editor.action.referenceSearch.trigger")
	end,

	goToImpl = function()
		vim.fn.VSCodeNotify("editor.action.goToImplementation")
	end,

	referenceInSideBar = function()
		vim.fn.VSCodeNotify("references-view.find")
	end,
	project = function()
		vim.fn.VSCodeNotify("editor.action.addSelectionToNextFindMatch")
		vim.fn.VSCodeNotify("workbench.action.findInFiles")
	end,
	text = function()
		vim.fn.VSCodeNotify("workbench.action.findInFiles")
	end,
	symbol = function()
		vim.fn.VSCodeNotify("workbench.action.gotoSymbol")
	end,
}

local refactor = {
	showMenu = function()
		vim.fn.VSCodeNotify("editor.action.refactor")
	end,
}

-- https://vi.stackexchange.com/a/31887
local nv_keymap = function(lhs, rhs)
	vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true, silent = true })
end

local nx_keymap = function(lhs, rhs)
	vim.api.nvim_set_keymap("n", lhs, rhs, { silent = true })
	vim.api.nvim_set_keymap("v", lhs, rhs, { silent = true })
end

--#region keymap
vim.g.mapleader = " "

-- nv_keymap("s", "}")
-- nv_keymap("S", "{")

nv_keymap("<leader>h", "^")
nv_keymap("<leader>l", "$")
nv_keymap("<leader>a", "%")

nx_keymap("j", "gj")
nx_keymap("k", "gk")

-- vim.keymap.set({ "n", "v" }, "<leader>", whichkey.show)

-- vim.keymap.set({ "n" }, "<leader>i", editor.organizeImport)

-- no highlight
vim.keymap.set({ "n" }, "<Esc>", "<cmd>noh<cr>")

vim.keymap.set({ "n", "v" }, "<leader> ", workbench.showCommands)

vim.keymap.set({ "n", "v" }, "H", workbench.previousEditor)
vim.keymap.set({ "n", "v" }, "L", workbench.nextEditor)

-- refactor
-- vim.keymap.set({ "v" }, "<leader>r", refactor.showMenu)
vim.keymap.set({ "n" }, "<leader>rr", symbol.rename)
vim.api.nvim_set_keymap("n", "<leader>rd", "V%d", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>rv", "V%", { silent = true })

-- bookmark
vim.keymap.set({ "n" }, "<leader>m", bookmark.toggle)
vim.keymap.set({ "n" }, "<leader>mt", bookmark.toggle)
vim.keymap.set({ "n" }, "<leader>ml", bookmark.list)
vim.keymap.set({ "n" }, "<leader>mn", bookmark.next)
vim.keymap.set({ "n" }, "<leader>mp", bookmark.previous)

vim.keymap.set({ "n" }, "<leader>sr", search.reference)
vim.keymap.set({ "n" }, "gr", search.reference)
vim.keymap.set({ "n" }, "gI", search.goToImpl)
vim.keymap.set({ "n" }, "<leader>sR", search.referenceInSideBar)
vim.keymap.set({ "n" }, "<leader>sp", search.project)
vim.keymap.set({ "n" }, "<leader>st", search.text)
vim.keymap.set({ "n" }, "<leader>sb", search.symbol)

--#endregion keymap

-- #region debug
-- Debug
local debug = {
	-- Next change
	start = function()
		vim.fn.VSCodeNotify("workbench.action.debug.start")
	end,

	restart = function()
		vim.fn.VSCodeNotify("workbench.action.debug.restart")
	end,

	-- toggle debug point
	toggleBreakpoint = function()
		vim.fn.VSCodeNotify("editor.debug.action.toggleBreakpoint")
	end,

	removeAllBreakpoints = function()
		vim.fn.VSCodeNotify("workbench.debug.viewlet.action.removeAllBreakpoints")
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
vim.keymap.set({ "n" }, "<leader>dr", debug.restart)
vim.keymap.set({ "n" }, "<leader>dt", debug.terminateSession)
vim.keymap.set({ "n" }, "<leader>db", debug.toggleBreakpoint)
vim.keymap.set({ "n" }, "<leader>dc", debug.continue)
vim.keymap.set({ "n" }, "<leader>dd", debug.disablePoint)
vim.keymap.set({ "n" }, "<leader>da", debug.removeAllBreakpoints)
vim.keymap.set({ "n" }, "<leader>dn", debug.stepOver)
-- #endregion debug
--
--
-- CODE ACTION
--
local editor = {
	closeActive = function()
		vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
	end,

	codeAction = function()
		vim.fn.VSCodeNotify("editor.action.refactor")
		vim.fn.VSCodeNotify("editor.action.quickFix")
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
--#region
-- FILE
--
local file = {
	findFile = function()
		vim.fn.VSCodeNotify("workbench.action.quickOpen")
	end,

	new = function()
		-- vim.fn.VSCodeNotify("workbench.explorer.fileView.focus")
		vim.fn.VSCodeNotify("extension.advancedNewFile")
	end,

	save = function()
		vim.fn.VSCodeNotify("workbench.action.files.save")
	end,

	saveAll = function()
		vim.fn.VSCodeNotify("workbench.action.files.saveAll")
	end,

	grep = function()
		-- if grep extension is used
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
vim.keymap.set({ "n", "v" }, "<leader>sg", file.grep)
vim.keymap.set({ "n", "v" }, "<space>wa", file.saveAll)
vim.keymap.set({ "n", "v" }, "<space>fs", file.save)
vim.keymap.set({ "n", "v" }, "<space>fS", file.saveAll)
vim.keymap.set({ "n" }, "<space>fn", file.new)
vim.keymap.set({ "n" }, "<space>ft", file.showInExplorer)
vim.keymap.set({ "n" }, "<space>fr", file.rename)
--
--#endregion
--
--#region
-- GIT

local git = {

	-- Next change
	nextHunk = function()
		vim.fn.VSCodeNotify("workbench.action.editor.nextChange")
	end,

	-- Lazy git
	lazygit = function()
		vim.fn.VSCodeNotify("lazygit-vscode.toggle")
	end,

	-- if gitlens installed
	graph = function()
		vim.fn.VSCodeNotify("gitlens.showGraphPage")
	end,

	currentChanges = function()
		vim.fn.VSCodeNotify("editor.action.dirtydiff.next")
	end,
}

-- git
vim.keymap.set({ "n" }, "<leader>gg", git.lazygit)
vim.keymap.set({ "n" }, "<leader>gn", git.nextHunk)
vim.keymap.set({ "n" }, "<leader>gc", git.currentChanges)
-- vim.keymap.set({ "n" }, "<leader>gg", git.graph)
--
--#endregion
--
--#region
-- FOLD

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
vim.keymap.set({ "n" }, "zG", fold.openAllMarkerRegion)
vim.keymap.set({ "n" }, "zg", fold.allMarkerRegion)
vim.keymap.set({ "n" }, "za", fold.toggle)
--
--#endregion
--
--#region Error
--

local error = {
	list = function()
		vim.fn.VSCodeNotify("workbench.actions.view.problems")
	end,
	next = function()
		vim.fn.VSCodeNotify("editor.action.marker.next")
	end,
	previous = function()
		vim.fn.VSCodeNotify("editor.action.marker.prev")
	end,
}

-- error
vim.keymap.set({ "n" }, "<leader>el", error.list)
vim.keymap.set({ "n" }, "<leader>en", error.next)
vim.keymap.set({ "n" }, "<leader>ep", error.previous)
--
--#endregion
--
--#region TOGGLE
--
local toggle = {
	toggleActivityBar = function()
		vim.fn.VSCodeNotify("workbench.action.toggleActivityBarVisibility")
	end,
	toggleSideBarVisibility = function()
		vim.fn.VSCodeNotify("workbench.action.toggleSidebarVisibility")
	end,
	toggleZenMode = function()
		vim.fn.VSCodeNotify("workbench.action.toggleZenMode")
	end,
	theme = function()
		vim.fn.VSCodeNotify("workbench.action.selectTheme")
	end,
	tree = function()
		vim.fn.VSCodeNotify("workbench.view.explorer")
	end,
}
-- toggle
vim.keymap.set({ "n" }, "<leader>e", toggle.tree)
vim.keymap.set({ "n", "v" }, "<leader>ta", toggle.toggleActivityBar)
vim.keymap.set({ "n", "v" }, "<leader>tz", toggle.toggleZenMode)
vim.keymap.set({ "n", "v" }, "<leader>ts", toggle.toggleSideBarVisibility)
vim.keymap.set({ "n", "v" }, "<leader>tt", toggle.theme)
--
--#endregion

local project = {
	switch = function()
		vim.fn.VSCodeNotify("workbench.action.openRecent")
	end,
}

-- flutter
vim.keymap.set({ "n" }, "<leader>fs", function()
	vim.fn.VSCodeNotify("flutter.selectDevice")
end)

vim.keymap.set({ "n" }, "<leader>fc", function()
	vim.fn.VSCodeNotify("flutter.clean")
end)

-- project
vim.keymap.set({ "n" }, "<leader>pp", project.switch)

-- Github copilot

vim.keymap.set({ "n", "v" }, "<leader>ak", function()
	vim.fn.VSCodeNotify("github.copilot.chat.attachSelection")
end)

--
-- LAZY VIM
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)



-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			"kylechui/nvim-surround",
			version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
				})
			end,
		},
		-- FLASH
		{
			"folke/flash.nvim",
			event = "VeryLazy",
			---@type Flash.Config
			opts = {},
			keys = {
				{
					"s",
					mode = { "n", "x", "o" },
					function()
						require("flash").jump()
					end,
					desc = "Flash",
				},
				{
					"S",
					mode = { "n", "x", "o" },
					function()
						require("flash").treesitter()
					end,
					desc = "Flash Treesitter",
				},
				{
					"r",
					mode = "o",
					function()
						require("flash").remote()
					end,
					desc = "Remote Flash",
				},
				{
					"R",
					mode = { "o", "x" },
					function()
						require("flash").treesitter_search()
					end,
					desc = "Treesitter Search",
				},
				{
					"<c-s>",
					mode = { "c" },
					function()
						require("flash").toggle()
					end,
					desc = "Toggle Flash Search",
				},
			},
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					ensure_installed = {
						"c",
						"lua",
						"vim",
						"dart",
						"swift",
						"kotlin",
						"vimdoc",
						"query",
						"elixir",
						"heex",
						"javascript",
						"html",
					},
					sync_install = false,
					highlight = { enable = true },
					indent = { enable = true },
				})
			end,
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
