local function bind(op, outer_opts)
	outer_opts = outer_opts or { noremap = true }
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", outer_opts, opts or {})
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

local nmap = bind("n", { noremap = false })
local nnoremap = bind("n")
local vnoremap = bind("v")
-- local xnoremap = bind("x")
local inoremap = bind("i")
local tnoremap = bind("t")

-- Fast saving
nnoremap("<leader>w", ":w!<cr>")
nnoremap("<leader>ц", ":w!<cr>")
-- press jk to exit from insert mode
inoremap("jk", "<Esc>")
inoremap("kj", "<Esc>")
-- copy to system clipboard by Ctrl+c in the Visual mode
vnoremap("<C-c>", '"+y')
-- paste in normal mode from system clipboard
vnoremap("<C-p>", '"+p')
nnoremap("<C-p>", '"+p')
inoremap("<C-p>", '<esc>"+p')

-- Close all tabs
nnoremap("<leader>a", ":qa!<cr>")
nnoremap("<leader>ф", ":qa!<cr>")

nmap("Ф", "A")
nmap("Ш", "I")

-- open terminal in split below and start Insert mode
nnoremap("<leader>t", ":belowright split | resize 10 | terminal<cr>i")

-- terminal mode related
-- close terminal window
tnoremap("<C-d>", "<C-\\><C-n>:q!<cr>")
-- exit terminal insert mode
tnoremap("<Esc>", "<C-\\><C-n>")
-- exit terminal's insert mode and go to upper window
tnoremap("jk", "<C-\\><C-n><C-w>k")
-- Ctrl+4 to close terminal window
tnoremap("<C-\\>", "<C-\\><C-n>:bd!<cr>")

-- Close the current buffer
nmap("<leader>bd", ":bd!<cr>")
-- Ctrl+4 to close window and keep buffer
nmap("<C-\\>", ":q<cr>")
-- Close all the buffers
nmap("<leader>ba", ":bufdo bd<cr>")

nnoremap("<leader>l", ":bnext<cr>")
nnoremap("<leader>h", ":bprevious<cr>")
-- fzf open file and edit
nnoremap("<leader>F", ":Ffnd<cr>")

nnoremap("<leader>T", ":TroubleToggle<cr>")

nnoremap("0", "^")
nnoremap("<leader>o", "o<ESC>")
nnoremap("<leader>O", "O<ESC>")

nnoremap("Q", "<nop>")

-- copy current buffer's absolute path to clipboard
nnoremap("<leader>cl", ':let @+=expand("%:p")<cr>')

-- copy current line to system clipboard
nnoremap("<leader>cc", '"+yy')

-- source current buffer
nnoremap("<leader>cs", ":so %<cr>")

-- append ; to the end of line
inoremap("<leader>;", "<Esc>A;<Esc>")
nnoremap("<leader>;", "<Esc>A;<Esc>")
-- Git
nnoremap("<leader>gs", ":Gitsigns stage_hunk<cr>")
nnoremap("<leader>gS", ":Gitsigns stage_buffer<cr>")
nnoremap("<leader>gr", ":Gitsigns reset_hunk<cr>")
nnoremap("<leader>gu", ":Gitsigns undo_stage_hunk<cr>")
nnoremap("<leader>gR", ":Gitsigns reset_buffer<cr>")
nnoremap("<leader>gp", ":AsyncRun git push<cr>")
-- Fugitive
nnoremap("<leader>gg", ":Git<cr>")
-- Telescope
nnoremap("<leader>ff", ":Telescope find_files<cr>")
nnoremap("<leader>fb", ":Telescope file_browser<cr>")
nnoremap("<leader>fg", ":Telescope live_grep<cr>")
nnoremap("<leader>fj", ":Telescope jumplist<cr>")
nnoremap("<leader>fs", ":Telescope git_status<cr>")
nnoremap("<leader>fh", ":Telescope command_history<cr>")
nnoremap("<leader>p", ":Telescope projects<cr>")
-- NeoTree
nnoremap("<leader>n", ":NeoTreeFocusToggle<cr>")
-- AsyncTask
nnoremap("<leader>eb", ":AsyncTask project-build<cr>")
nnoremap("<leader>er", ":AsyncTask project-run<cr>")
nnoremap("<leader>ee", ":call asyncrun#quickfix_toggle(8)<cr>")
