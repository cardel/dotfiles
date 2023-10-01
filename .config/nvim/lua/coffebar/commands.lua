local augroup = vim.api.nvim_create_augroup("user_cmds", { clear = true })

vim.api.nvim_create_user_command("SearchInHome", function()
  require("telescope.builtin").find_files({
    cwd = "~",
    find_command = {
      "rg",
      "--files",
      "--hidden",
      "--one-file-system",
      "--ignore-file",
      ".config/nvim/ignore.rg",
      "--max-depth",
      "7",
    },
  })
end, {})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  desc = "Return to last edit position when opening files",
  command = 'if line("\'\\"") > 1 && line("\'\\"") <= line("$") | exe "normal! g\'\\"" | endif',
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif" },
  desc = "Open images in external viewer-editor",
  callback = function()
    local image_viewers = {
      -- first found program will be used to open image
      "pix", -- https://github.com/linuxmint/pix
      "feh",
    }
    -- search for installed program
    for _, program in ipairs(image_viewers) do
      if vim.fn.executable(program) == 1 then
        local file = vim.fn.expand("%:p")
        vim.fn.jobstart({ program, file }, { detach = true })
        -- image buffer is not useful in binary representation.
        -- Will close buffer without closing a window
        vim.api.nvim_command("bp | sp | bn | bd")
        return
      end
    end
  end,
})

local function update_git_env_for_dotfiles()
  -- Auto change ENV variables to enable
  -- bare git repository for dotfiles after
  -- loading saved session
  local home = vim.fn.expand("~")
  local git_dir = home .. "/dotfiles"

  if vim.env.GIT_DIR ~= nil and vim.env.GIT_DIR ~= git_dir then
    return
  end

  -- check dotfiles dir exists on current machine
  if vim.fn.isdirectory(git_dir) ~= 1 then
    vim.env.GIT_DIR = nil
    vim.env.GIT_WORK_TREE = nil
    return
  end

  -- check if the current working directory should belong to dotfiles
  local cwd = vim.loop.cwd()
  if vim.startswith(cwd, home .. "/.config/") or cwd == home or cwd == home .. "/.local/bin" then
    if vim.env.GIT_DIR == nil then
      -- export git location into ENV
      vim.env.GIT_DIR = git_dir
      vim.env.GIT_WORK_TREE = home
    end
  else
    if vim.env.GIT_DIR == git_dir then
      -- unset variables
      vim.env.GIT_DIR = nil
      vim.env.GIT_WORK_TREE = nil
    end
  end
end

-- Optimize for large files
vim.api.nvim_create_autocmd("BufReadPre", {
  desc = "Disable filetype for large files (>200KB)",
  command = 'let f=expand("<afile>") | if getfsize(f) > 200*1024 | set eventignore+=FileType | else | set eventignore-=FileType | endif',
  group = augroup,
})

-- Auto formatting
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.scss", "*.lua", "*.html" },
  desc = "Format files on write",
  callback = function()
    vim.api.nvim_command("FormatWrite")
  end,
  group = augroup,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ on_visual = false, timeout = 150 })
  end,
  group = augroup,
})

-- Git commit spell checking
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.spell = true
  end,
  group = augroup,
})

-- Close diffview on q
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "DiffviewFileHistory" },
  desc = "Close diffview on q",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>DiffviewClose<cr>", { buffer = true, silent = true })
  end,
  group = augroup,
})

-- Close special buffers on q
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "checkhealth",
    "dirbuf",
    "floggraph",
    "fugitive",
    "fugitiveblame",
    "git",
    "help",
    "qf",
    "spectre_panel",
  },
  desc = "Close buffers on q",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>bdelete<cr>", { buffer = true, silent = true })
  end,
  group = augroup,
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
  desc = "Disable line numbers in terminal",
  group = augroup,
})

vim.api.nvim_create_autocmd("DirChanged", {
  pattern = { "*" },
  group = augroup,
  desc = "Update git env for dotfiles after changing directory",
  callback = function()
    update_git_env_for_dotfiles()
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = { "SessionLoadPost" },
  group = augroup,
  desc = "Update git env for dotfiles after loading session",
  callback = function()
    update_git_env_for_dotfiles()
    -- restart lsp server for PHP to reload includePaths
    vim.api.nvim_command("silent! LspRestart intelephense")
  end,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true, buffer = ev.buf }
    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gD", ":Lspsaga peek_definition<cr>", opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", ":Lspsaga hover_doc<cr>", opts)
    vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<cr>", opts)
    vim.keymap.set("n", "gr", ":Lspsaga finder<cr>", opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<cr>", opts)

    -- get client name by id ev.data.client_id
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    local force_formatter = not client.server_capabilities.documentFormattingProvider

    if not force_formatter then
      -- force to use Formatter plugin for this client
      force_formatter = client.name == "lua_ls"
        or client.name == "tsserver"
        or client.name == "pyright"
        or client.name == "ansiblels"

      if client.name == "intelephense" then
        -- force use prettier for php
        local bufname = vim.api.nvim_buf_get_name(ev.buf)
        if string.match(bufname, ".php$") then
          force_formatter = true
        end
      end
    end

    if force_formatter then
      vim.keymap.set({ "n", "v" }, "=", ":Format<cr>", opts)
    else
      vim.keymap.set({ "n", "v" }, "=", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end

    -- Inlay Hints
    if vim.lsp.inlay_hint then
      if client.server_capabilities.inlayHintProvider == true then
        vim.lsp.inlay_hint(ev.buf, true)
        vim.keymap.set("n", "<leader>I", function()
          vim.lsp.inlay_hint(0, nil)
        end, opts)
      else
        vim.lsp.inlay_hint(ev.buf, false)
      end
    end
  end,
})
