return {
	"nvim-treesitter/nvim-treesitter",
	run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
	config = function()
		require'nvim-treesitter.configs'.setup {
			-- A list of parser names, or "all" (the four listed parsers should always be installed)
			ensure_installed = { "c", "cpp", "rust", "json",
					     --"help", "bash", "arduino", "css", "gitignore", "html", "javascript", "make", "markdown", "yaml", "toml", "python", "lua" -- known to crash windows
		},

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

			-- Use curl + tar
			prefer_git=false,
			compilers = { "clang", "gcc" },

			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
				-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
				-- the name of the parser)
				-- list of language that will be disabled
				-- disable = { "c", "rust" },
				-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
				-- disable = function(lang, buf)
				-- 		local max_filesize = 100 * 1024
				-- 		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				-- 		if ok and stats and stats.size > max_filesize then
				-- 				return true
				-- 		end
				-- end,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
		}
	end
}
